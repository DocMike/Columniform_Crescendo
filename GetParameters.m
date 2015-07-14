function Transfer=GetParameters(StructPath)

load(StructPath)

SlashInd=regexp(StructPath, '[\\/]');
LastSlash=SlashInd(end);
FilePath=StructPath(1:LastSlash);

FilePath=strcat(FilePath, 'TransferParameters.xlsx');

Parameters=importdata(FilePath);
ParameterDim=size(Parameters.data);

count=1;
for i=1:ParameterDim(1)
for j=7:ParameterDim(2)
    
        
        if isnan(Parameters.data(i,j))==1
        else
        mobility(count)=Parameters.data(i,j);
        count=count+1;
        end
        


    end
end
mobility
count=1
listcurve={'a'}
list={'b'}
for i=1:length(Transfer)
    
%     disp(list)
%     disp(listcurve)
ComboList = strcat(list, ' ', listcurve);
FullName = strcat(Transfer(i).Name, ' ', Transfer(i).Curve);

if sum(strcmp(Transfer(i).Curve, listcurve))~=0 ...
        && sum(strcmp(Transfer(i).Name, list))~=0 ...
        && sum(strcmp(FullName,ComboList))
    
    j=find(strcmp(Transfer(i).Curve,listcurve))
    
    Transfer(i).mobility=Transfer(j).mobility;
    
else
    
    Transfer(i).mobility=mobility(count);
    count=count+1;
end
index=find(strcmp(Parameters.textdata, Transfer(i).Name));
index=index-1;
Transfer(i).Capacitance=Parameters.data(index,1);
Transfer(i).Width=Parameters.data(index,3);
Transfer(i).Length=Parameters.data(index,4);
Transfer(i).VDS=Parameters.data(index,6);






listcurve(i)=Transfer(i).Curve;
list(i)={Transfer(i).Name}
end
save(StructPath, 'Transfer');
end


