function StructPath = AnalyzeTransfer(FolderName, type)

Directory = BuildDirectory(FolderName);
StructPath = BuildTransferStruct(Directory);
getID(StructPath)
Discretize(StructPath)
GetParameters(StructPath)
GetMobility(StructPath)

end