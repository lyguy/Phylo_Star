function [dmatricies,treeforest] = fstarf(treefile,outfile,StarLength)
% function FSTARF takes in a tree file and gives back a maple file with
%   the distance matricies from star. Future versions will take in tree file and
%   file of probability polys and retun maple file with the averaged
%   distance matrix.
%
% Depends on: READFOREST, MAKEULTRA, MATRIXTOMAPLE
%
% rev 2: Lyman Gillispie 12/1/2011
% TODO: 
%       * put list of trees into a maple array in order
%       * it we're missing options, select them with the ui
%       * exception handling, how do we know that the forest in the file is legit,
%         how do we know that it matches the probfile etc.
%       * bugtesting, also verify all of this stuff, esp MATRIXTOMAPLE leaf
%         ordering



%% make distance matricies
treeforest = ReadForest(treefile);
NumTrees = length(treeforest);
dmatricies = cell(1,NumTrees);

for ii = 1:NumTrees
    if nargin > 2
        startree = makeultra(treeforest{ii},StarLength);
    else
        startree = makeultra(treeforest{ii});
    end
    %makes dist matricies and sorts in order of leaf names
    [names,ix] = sort(get(startree,'LeafNames'));
    DD = pdist(startree,'Nodes','Leaves','squareform',true);
    dmatricies{ii} = DD(ix,ix);
end

%% write distance matricies to outfile

outfid = fopen(outfile,'w');

fprintf(outfid, '%s\n%s %s\n','# Matricies and probabilities for STAR','# Leaf names are, in order:',cell2mat(names));
fprintf(outfid, '%s\n', ['# Tree Topologies taken from file: ', treefile]);
if nargin > 2
    LengthStr = sprintf('%i,',StarLength);
    LengthStr = ['# Internal branches have the following lengths, in order of level from root: ',LengthStr(1:end-1)]; 
    fprintf(outfid, '%s\n', LengthStr);
else
    fprintf(outfid, '%s\n', '# Each internal branch has length 1');
end
MtrStr  = [];
for ii = 1:NumTrees
    TopoStr = ['# Tree', int2str(ii), ' topology ', getnewickstr(treeforest{ii})];
    fprintf(outfid,'%s\n',TopoStr);
    MtrStr = ['Tree', int2str(ii), ':=',matrixtomaple(dmatricies{ii}),':'];
    fprintf(outfid,'%s\n',MtrStr);
end

fprintf(outfid,'%s','DMatricies := Array([');
for ii = 1:NumTrees
   fprintf(outfid,'%s',['Tree',int2str(ii),',']);
end
fprintf(outfid,'%s',']):');


%%
fclose(outfid);


end
