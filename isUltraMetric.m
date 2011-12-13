function [aa, DD] = isUltraMetric(tr)

% isUltraMetric reads in a rooted phytree and returns true if
% the tree is ultramatric and false otherwise
% If the DD argument is returned, the distance matrix is returned as well
% 
% exception handling need to be implemented
%


NLeaves = get(tr,'NumLeaves');
NNodes = get(tr,'NumNodes');
DD = pdist(tr, 'Nodes', 'all', 'Squareform',true);
DfromRoot = DD(1:NLeaves,NNodes);
aa = (max(DfromRoot) == min(DfromRoot));
end





