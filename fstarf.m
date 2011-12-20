function [dmatricies,treeforest] = fstarf(treefile,outfile,StarLength)
%%
% # `[dmatricies,treeforest] = FSTARF(treefile,outfile,StarLength)`
%
% Accepts the path of a text file of Newick-formated trees and returns a cell-array of 
% the distance matricies for STAR.
% Does the same thing as MSTARF except creates a file
%
% ##Arguments:
% * `treefile`: path to a text-file of Newick-format rooted binary trees,
% * `outfile`: path to output file, if it does not exist it will be
% created, if it exists it will be overwritten.
% seperated by new lines (see `READFOREST`)
% * `StarLength`: lengths for internal edges of the gene-trees
%
% ##Return Values:
% * `dmatricies`: cell-array of the distance matricies(gene-trees), made ultra-metric,
% these may then be averaged for STAR 
% * `treeforest`: cell-array of the gene-trees from `treefile`
%
% `dmatrix{ii}` corresponds to the tree `treeforest{ii}`
%
% Depends on: `READFOREST`, `MAKEULTRA`
%
% #TODO: 
% * if we're missing options, select them with the ui
% * warning about overwriting files?
% * error handling, how do we know that the forest in the file is legit,
%         how do we know that it matches the probfile etc.
%%
%% make distance matricies
treeforest = ReadForest(treefile);
NumTrees = length(treeforest);
dmatricies = cell(1,NumTrees);
% ensures every tree has same root-to-leaf distnace
ntaxa = get(treeforest{1},'NumLeaves');
if nargin >1
    dleaftoroot = sum(StarLength(1:ntaxa-1));
else
    dleaftoroot = ntaxa-1;
end

for ii = 1:NumTrees
    if nargin > 2
        startree = makeultra(treeforest{ii},StarLength,dleaftoroot);
    else
         startree = makeultra(treeforest{ii},ones(1,ntaxa),dleaftoroot);
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
