function [dmatricies,treeforest] = mstarf(treefile,StarLength)
%%
% # `[dmatricies,treeforest] = MSTARF(treefile,StarLength)`
%
% Accepts the path of a text file of Newick-formated trees and returns a cell-array of 
% the distance matricies for STAR.
% Does the same thing as FSTARF except doesn't create a file
%
% ##Arguments:
% * `treefile`: path to a text-file of Newick-format rooted binary trees,
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
    if nargin > 1
        startree = makeultra(treeforest{ii},StarLength,dleaftoroot);
    else
         startree = makeultra(treeforest{ii},ones(1,ntaxa),dleaftoroot);
    end
    %makes dist matricies
    [~,ix] = sort(get(startree,'LeafNames'));
    DD = pdist(startree,'Nodes','Leaves','squareform',true);
    dmatricies{ii} = DD(ix,ix);
end

end
