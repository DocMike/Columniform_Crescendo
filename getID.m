function []=getID(StructPath)

load(StructPath);

for i=1:length(Transfer)
    if strcmp(Transfer(i).SQRT, 'SQRT')==1
        Transfer(i).IDNan=(Transfer(i).RawID).^2;
    else
        Transfer(i).IDNan=Transfer(i).RawID;
    end
    
    for j=1:length(Transfer(i).IDNan)
        if isnan(Transfer(i).IDNan(j))==1
            break
        else
        Transfer(i).VG(j,1)=Transfer(i).RawVG(j,1);
        Transfer(i).ID(j,1)=Transfer(i).IDNan(j,1);
       
        end
    end
    
   
    

end
Transfer=rmfield(Transfer, 'IDNan');
save(StructPath, 'Transfer');
end