function [R]=strcelltomaple(M)
%%
% #`[R]=strcelltomaple(M)`
% Reads a Matlab stringcell `M` and returns the string `R`, which is `M`
% formated for entry into Maple as a matrix
% See also: `matrixtomaple.m`
% 
% TODO: * exception handling (double chek it's a matrix?)
%       * can we preallocate `TT` so that the loop speeds up?
%%

R = 'Matrix([';
L = length(M);
for ii = 1:L
    TT = sprintf('%s,',M{ii,:});
    if ~(ii==L) 
        TT = ['[', TT(1:end-1),'],']; 
    else
        TT = ['[', TT(1:end-1),']'];
    end    
    R = [R,TT];
end
R = [R, '])'];
end