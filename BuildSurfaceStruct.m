function StructPath=BuildSurfaceStruct(Directory)


Surface=struct();

NumFiles=length(Directory);

count=0;

for i=1:NumFiles
    FilePath=strcat(Directory{i,1}, '.txt');
    [temp, txt]=importdata(FilePath);
    
    [Data, VD, VG]=ConvertRaw(temp);
   
 SlashInd=regexp(Directory{i,1}, '[\\/]');
    LastSlash=SlashInd(end);
    SpecName=FilePath(LastSlash+1:end-4);
    
    Surface(i).FilePath=FilePath;
    Surface(i).Data=Data;
    Surface(i).VD=VD;
    Surface(i).VG=VG;
    Surface(i).Name=SpecName;
    Surface(i).Width=2000;
    Surface(i).Capacitance=1.15*10^-8;
    Surface(i).Length=50;
    
   
end
Folder=FilePath(1:LastSlash);
 StructPath=[Folder 'SurfaceStruct'];
 save(StructPath, 'Surface');
    
end