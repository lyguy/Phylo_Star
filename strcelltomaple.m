function [R]=strcelltomaple(M)
% takes in a Matlab cellarray of strings and spits out string for maple.
% 10-31-2011 Lyman Gillispie
% TODO: *verify that the reordering of the leaves works
%       *bugtest

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