function [treecollect] =  ReadForest(filename)
% function READFOREST returns a cell array of phytrees from a file
%
% rev1. Lyman Gillispie current as of 11/2/11
% TODO:
%   * need to preallocate for treecollect cell array to speed up loop? 
%   * need to bug test

if nargin ==0
    [filename, pathname] = uigetfile({'*.tree';'*.dnd'},'Select Phylogenetic Tree File');
    if ~filename
        disp('Canceled , file not read.');
        treecollect = [];
        return;
    end
    filename = [pathname,filename];
end

% Check input is a char
if ~ischar(filename)
    error('Bioinfo:gillispiefiles:ReadForest:InvalidInput','Input must be a character array.');
elseif  ~(exist(filename,'file') || exist(fullfile(pwd,filename),'file') )    %  is a valid filename ?
    error('Bioinfo:gillispiefiles:ReadForest:FileDoesnotExist','File "%s" does not exist.',filename);
end

fid = fopen(filename,'r');
tline = fgetl(fid);
ii = 1; % is it possible to preallocate treecollect and speed up the loop?
while ischar(tline)
    tr = phytreeread(tline(1:end-1));
    treecollect{ii} = tr;
    tline = fgetl(fid);
    ii= ii +1;
end
fclose(fid);
treecollect = treecollect';
end