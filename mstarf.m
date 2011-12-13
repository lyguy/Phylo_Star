function [dmatricies,treeforest] = mstarf(treefile,StarLength)
% function MSTARF takes in a tree file and gives back a cell-array of 
%   the distance matricies from star.
%   Does the same thing as FSTARF except doesn't spit back a file
%
% Depends on: READFOREST, MAKEULTRA,
%
% rev 2: Lyman Gillispie 11/18/2011
% 
%       * it we're missing options, select them with the ui
%       * error handling, how do we know that the forest in the file is legit,
%         how do we know that it matches the probfile etc.
%       * bugtesting, also verify all of this stuff, esp MATRIXTOMAPLE leaf
%         ordering



%% make distance matricies
treeforest = ReadForest(treefile);
NumTrees = length(treeforest);
dmatricies = cell(1,NumTrees);

for ii = 1:NumTrees
    if nargin > 1
        treeforest{ii} = makeultra(treeforest{ii},StarLength);
    else
        treeforest{ii} = makeultra(treeforest{ii});
    end
    %makes dist matricies
    [names,ix] = sort(get(treeforest{ii},'LeafNames'));
    DD = pdist(treeforest{ii},'Nodes','Leaves','squareform',true);
    dmatricies{ii} = DD(ix,ix);
end

end
