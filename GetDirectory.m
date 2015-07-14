function Directory=GetDirectory(DirectoryPath, type)

if type==1
M=importdata([DirectoryPath, 'Directory.xlsx'])
elseif type==2
M=importdata([DirectoryPath, 'TransferDirectory.xlsx'])
end

Directory=M(:,1)


end
