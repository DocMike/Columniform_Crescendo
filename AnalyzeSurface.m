function StructPath = AnalyzeSurface(FolderName, type)

Directory = BuildDirectory(FolderName, type);
StructPath = BuildSurfaceStruct(Directory);
GetLinMobility(StructPath)
GetSatMobility(StructPath)

end