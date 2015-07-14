function Transfer=GetMobility(StructPath)


load(StructPath);

 for i=1:length(Transfer)

if Transfer(i).VDS<-10
    %Saturation
  VD=Transfer(i).VDS
  VG=Transfer(i).VG5
  ID=Transfer(i).ID5
  W=Transfer(i).Width
  L=Transfer(i).Length
  C=Transfer(i).Capacitance
  
  ID=sqrt(ID)
  
    for j=2:length(VG)-1
        gm(j)=(-ID(j-1)--ID(j+1))/(VG(j-1)-VG(j+1))
        x1=VG(j)
        y1=-ID(j)
        VT(j)=(-y1+gm(j)*x1)/gm(j)
        mobility(j)=2*L*(gm(j))^2/(W*C)
    end
    
else
  %Linear
   VD=Transfer(i).VDS
  VG=Transfer(i).VG5
  ID=Transfer(i).ID5
  W=Transfer(i).Width
  L=Transfer(i).Length
  C=Transfer(i).Capacitance
  
   for j=2:length(VG)-1
        gm(j)=(-ID(j-1)--ID(j+1))/(VG(j-1)-VG(j+1))
        x1=VG(j)
        y1=-ID(j)
        VT(j)=(-y1+gm(j)*x1)/gm(j)
        mobility(j)=L*gm(j)/(W*C*(-VD))
    end
  
end




Transfer(i).VT=VT
Transfer(i).CalMobility=mobility
 




 end
save(StructPath, 'Transfer');
end
