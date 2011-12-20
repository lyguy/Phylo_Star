function [R]=matrixtomaple(M)
%%
% #`[R]=marixtomaple(M)`
% Reads a Matlab matrix `M` and returns the string `R`, which is `M`
% formated for entry into Maple
% See also: `strcelltomaple.m`
% 
% TODO: * exception handling (double chek it's a matrix?)
%       * can we preallocate `R` so that the loop speeds up?
%%

R = 'Matrix([';
L = length(M);
for ii = 1:L
    TT = sprintf('%i,',M(ii,:));
    TT = ['[', TT(1:end-1),']'];
    if ~(ii==L), TT = [TT, ','];end    
    R = [R,TT];
end
R = [R, '])'];
end