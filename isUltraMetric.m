function [aa, DD] = isUltraMetric(tr)
%%
% #`[aa,DD] = isUltraMetric(tr)`
% Takes  a rooted phytree `tr`, `aa = true` if the tree is ultramatric, and
% is `false` otherwise. `DD` the patristic distance matrix may be returnd
% for `tr` may be returned as well.
% 
% `isUltraMetric` is not clled by anything else, and may be depricated in the future. 
%%
NLeaves = get(tr,'NumLeaves');
NNodes = get(tr,'NumNodes');
DD = pdist(tr, 'Nodes', 'all', 'Squareform',true);
DfromRoot = DD(1:NLeaves,NNodes);
aa = (max(DfromRoot) == min(DfromRoot));
end





