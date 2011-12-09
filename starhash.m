function [symlen] = starhash(len)

% takes in encoded integer length and returns string for symbolic for
% branchlengths. is a sample for now.
%
%

slen = sprintf('%i',len);
slen = slen(end:-1:1);
LL = length(slen);
symlen = [];

for ii = 1:LL
    if ~(slen(ii) == '0')
        symlen = [symlen , slen(ii) ,'*a[', sprintf('%i',ii),']+'];
    end
end


if ischar(symlen)
    symlen = symlen(1:end-1);
else
    symlen = '0';
end

end