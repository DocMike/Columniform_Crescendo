function Directory = BuildDirectory(FolderName, type)

%% Build Directory
% Takes the name of a folder full of UV-Vis .csv or electrical surface .txt files and a .xlsx directory
% and converts it to

% Directory: a cell array (Nx1) of strings that are the file paths of UV
% Vis csv files or elecgrical surface .txt files

%Input computer specfic pathway to the correct file
if type==1
if ispc
    DirectoryPath= ['C:\Users\Mike\Documents\GitHub\Ocular_Ascension\' FolderName '\'];
else
    DirectoryPath = ['/Users/Imperssonator/Documents/MATLAB/Ocular_Ascension/' FolderName '/'];
end

elseif type==2
if ispc
    DirectoryPath= ['C:\Users\Mike\Dropbox\OFET Fab Table\Papers\'];
else
    DirectoryPath = ['/Users/Imperssonator/Documents/MATLAB/Provincial_Bluffs/Papers/'];
end

end


%Read excel file of file names to populate the directory
Directory=GetDirectory(DirectoryPath, type);

for i=1:length(Directory)
Directory(i)=strcat(DirectoryPath, Directory(i))
end

end

