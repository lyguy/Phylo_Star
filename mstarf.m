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
ntaxa = get(treeforest{1},'NumLeaves');

if nargin >1
    DFromRoot = sum(StarLength(1:ntaxa-1));
else
    DFromRoot = ntaxa-1;
end

for ii = 1:NumTrees
    if nargin > 1
    treeforest{ii} = makeultra(treeforest{ii},StarLength,DFromRoot);
    else
         treeforest{ii} = makeultra(treeforest{ii},ones(1,ntaxa),DFromRoot);
    end
    %makes dist matricies
    [~,ix] = sort(get(treeforest{ii},'LeafNames'));
    DD = pdist(treeforest{ii},'Nodes','Leaves','squareform',true);
    dmatricies{ii} = DD(ix,ix);
end

end
