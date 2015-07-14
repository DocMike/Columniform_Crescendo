function StructPath=BuildTransferStruct(Directory)


Transfer=struct();

NumFiles=length(Directory);

count=0;

for i=1:NumFiles
    FilePath=strcat(Directory{i,1}, '\Transfer Curves\Raw Data.xlsx')
    [temp, txt]=xlsread(FilePath);
    dataset=size(temp)
    dataset=dataset(2)
    dataset=ceil(dataset/3) %Need to fix this line of code. 
   
    
    SlashInd=regexp(Directory{i,1}, '[\\/]');
    LastSlash=SlashInd(end);
    SpecName=FilePath(LastSlash+1:end-30);
    
   counter=1;
    for j=1:dataset
        count=count+1;
    Transfer(count).Name=SpecName;
    Transfer(count).Curve=txt(1,counter);
     Transfer(count).SQRT=txt(1, counter+1);
    Transfer(count).RawVG=temp(:, counter);
    Transfer(count).RawID=temp(:, counter+1);
    counter=counter+3;
    Folder = FilePath(1:LastSlash);
    end
end

 StructPath=[Folder 'TransferStruct'];
 save(StructPath, 'Transfer');
    
end