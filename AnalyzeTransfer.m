function StructPath = AnalyzeTransfer(FolderName)

Directory = BuildDirectory(FolderName);
StructPath = BuildStruct(Directory);
getID(StructPath)
Discretize(StructPath)
GetParameters(StructPath)
GetMobility(StructPath)

end