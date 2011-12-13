function [R]=matrixtomaple(M)
% takes in a Matlab matrix and spits out string for maple.
% 10-31-2011 Lyman Gillispie
% TODO: *verify that the reordering of the leaves works
%       *exception handling

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