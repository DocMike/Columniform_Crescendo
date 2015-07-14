function Directory = BuildDirectory(FolderName)

%% Build Directory
% Takes the name of a folder full of UV-Vis .csv files and a .xlsx directory
% and converts it to

% Directory: a cell array (Nx1) of strings that are the file paths of UV
% Vis csv files

%Input computer specfic pathway to the correct file
if ispc
    DirectoryPath= ['C:\Users\Mike\Dropbox\OFET Fab Table\' FolderName '\'];
else
    DirectoryPath = ['/Users/Imperssonator/Documents/MATLAB/Provincial_Bluffs/' FolderName '/'];
end

%Read excel file of file names to populate the directory
Directory=GetDirectory(DirectoryPath);

for i=1:length(Directory)
Directory(i)=strcat(DirectoryPath, Directory(i));
end

end

