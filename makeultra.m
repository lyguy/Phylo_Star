function umtree = makeultra(tr,edgelengths,dleaftoroot)
%%
% #`umtree = MAKEULTRA(tr,edgelengths,dleaftoroot)`
% 
%    Returns a rooted ultrametric tree with the topology of `tr`, internal branch lengths
%    defined by `edgelengths` and leaf-to-root distance defined by
%    `dleaftoroot`.
%     
% #Arguments:
%   * `tr`: rooted tree of class `phytree` from Matlab's Bioinformatics
%   tool box, branch lengths may be 0 or empty
%   * `edgelengths`: a vector where `edgelengths[ii]` is the length of an
%    internal branch at level `ii`
%   * `dleaftoroot`: is distance of leaves from the root in the final STAR tree
% 
% #TODO:
%  *  exception handling i.e. `edgelengths < DeepestLevel, dleaftoroot < Nodenum(end)` etc.
%  *  Might be faster if it checks ultrametric to start
%  *  Alternative for entering Node-Numbers instead of edge-lengths?
%  *  bugtesting
%%


NodeLevels = pdist(tr, 'Nodes', 'all', 'Squareform',true,'Criteria','levels');
NLeaves = get(tr,'NumLeaves');
LLevel = NodeLevels(1:NLeaves,end);
BLevel = NodeLevels(NLeaves+1:end,end);


BranchDist = zeros(NLeaves - 1,1);
LDist = zeros(NLeaves,1);
DeepestLevel = max(LLevel);

%if nargin > 1
    

    
%Default breanch lengths are "1"
if nargin == 1
    edgelengths = ones(DeepestLevel,1);
elseif length(edgelengths) < DeepestLevel
    error('Bioinfo:PhyloStar:makeultra:toofewedgelengths','length(edgelengths) < DeepestLevel: too few edge lengths');
end

%% Calculate d from root at each level
NodeNums = zeros(DeepestLevel,1);
NodeNums(1) = edgelengths(1);
for ii = 2:DeepestLevel
    NodeNums(ii) = NodeNums(ii-1) + edgelengths(ii);
end

% Uses branch length vector to determine default dist(leaf,root)
if nargin == 3 && (dleaftoroot < NodeNums(end))
    error('Bioinfo:PhyloStar:makeultra:dleaftorootTooSmall','dleaftoroot is < largest NodeNumber');
elseif nargin < 3
    dleaftoroot = NodeNums(end);
end



%% Calculate the distance from each parent
%   assign each internal branch based on edgelengths
for ii = 1:NLeaves-2
    BranchDist(ii) = edgelengths(BLevel(ii));
end;
%   assign leaf distancee based on dleaftoroot
for ii = 1:NLeaves
    if LLevel(ii) == 1
        LDist(ii) = dleaftoroot;
    else
        LDist(ii) = dleaftoroot - NodeNums(LLevel(ii) - 1);
    end
end;
umdist = [LDist;BranchDist];

umtree = phytree(get(tr,'Pointers'),umdist,get(tr,'LeafNames'));

end