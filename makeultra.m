function StarTree = makeultra(tr,StarLength,DFromRoot)

%   makestar returns the ultramatric tree for tr
%   as described in Allman & Rhodes and Liu
%   
%   StarLength is a vector where StarLength[ii] is the length of an
%   internal branch at level ii
%
%   DFromRoot is distance of leaves from the root in the final STAR tree
%
%   rev 1 Lyman Gillispie 11/2/2011
%   TODO:
%       * error handling i.e. StarLength < DeepestLevel, DFromRoot < Nodenum(end) etc.
%       * Might be faster if it checks ultrametric to start
%       * Might be nice to make inputing a forest an option?
%       * bugtesting


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
    StarLength = ones(DeepestLevel,1);
elseif length(StarLength) < DeepestLevel
    error('Bioinfo:gillispie:makeultra:toofewedgelength','length(StarLength) < DeepestLevel: too few edge lengths');
end

%% Calculate d from root at each level
NodeNums = zeros(DeepestLevel,1);
NodeNums(1) = StarLength(1);
for ii = 2:DeepestLevel
    NodeNums(ii) = NodeNums(ii-1) + StarLength(ii);
end

% Uses branch length vector to determine default dist(leaf,root)
if nargin == 3 && (DFromRoot < NodeNums(end))
    error('Bioinfo:gillispie:makeultra:DFromRoottooSmall','DFromRoot is < largest NodeNumber');
elseif nargin < 3
    DFromRoot = NodeNums(end);
end



%% Calculate the distance from each parent
for ii = 1:NLeaves-2
    BranchDist(ii) = StarLength(BLevel(ii));
end;
for ii = 1:NLeaves
    if LLevel(ii) ==1
        LDist(ii) = DFromRoot;
    else
        LDist(ii) = DFromRoot - NodeNums(LLevel(ii) - 1);
    end
end;
StarDist = [LDist;BranchDist];

StarTree = phytree(get(tr,'Pointers'),StarDist,get(tr,'LeafNames'));

end