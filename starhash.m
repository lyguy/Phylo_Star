function [symlen] = starhash(len)
%%
% #`[symlen] = starhash(len)
% 
% Accepts an integer `len` and returns a string `symlen` which is of the
% form
% >`symlen = <len(1)>*a[1] + <len(2)>*a[2] + ... + <len(ii)>*a[ii]`

% where `<len(ii)>` is the `ii`'th digit of `len`.
% This string is formated to be used in Maple, where an array `a`
% represents the branch lengths used for STAR, `a` may be left undefined,
% and manipulated symbolically 
%
% #TODO: *exception handling: esp. isstr(len)?
%%

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