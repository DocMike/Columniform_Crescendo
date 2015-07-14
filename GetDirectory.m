function Directory=GetDirectory(DirectoryPath)

M=importdata([DirectoryPath, 'TransferDirectory.xlsx'])

Directory=M(:,1)


end
