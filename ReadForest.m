function [treecollect] =  ReadForest(filename)
%%
% #`[treecollect] = READFOREST(filename)`
%
%  Accepts the path of a text file of Newick-formated trees and returns a cell array, where
%  element `treecollect{ii}` corresponds to line `ii` of `filename`
%
% #TODO:
%   * can we preallocate for treecollect cell array to speed up loop? 
%   * exception handling
%%

if nargin ==0
    [filename, pathname] = uigetfile({'*.tree';'*.dnd'},'Select Phylogenetic Tree File');
    if ~filename
        disp('Canceled , file not read.');
        treecollect = [];
        return;
    end
    filename = [pathname,filename];
end

% Check input is a char and filename exists
if ~ischar(filename)
    error('Bioinfo:PhyloStar:ReadForest:InvalidInput','Input must be a character array.');
elseif  ~(exist(filename,'file') || exist(fullfile(pwd,filename),'file') )    %  is a valid filename ?
    error('Bioinfo:PhyloStar:ReadForest:FileDoesnotExist','File "%s" does not exist.',filename);
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