function Surface=GetSatMobility(StructPath)


load(StructPath);

 for k=1:length(Surface)
     
     VD=Surface(k).VD;
     VG=Surface(k).VG;
     if isequal(VG, [0:-1:-80])==1
    
     else
         VG=[0:-1:-80];
     end
     
     Data=-Surface(k).Data;
     W=Surface(k).Width;
     L=Surface(k).Length;
     C=Surface(k).Capacitance;
    
     Data=real(sqrt(Data))
     
     
     Dim=size(Data);
     m=Dim(1);
     n=Dim(2);

%Dimension the result matrices:
VT=zeros(m,n);
mobility=zeros(m,n);
gm=zeros(m,n);
gd=zeros(m,n);

for i=1:length(VD)
  
     for j=2:length(VG)-1;
   gm(i,j)=(-Data(i,j-1)--Data(i,j+1))/(VG(j-1)-VG(j+1));
   x1=VG(j);
   y1=-Data(i,j);
   VT(i,j)=(-y1+gm(i,j)*x1)/gm(i,j);
   mobility(i,j)=2*L*(gm(i,j))^2/(W*C);
   
   end
end

hi=find(VG==-60);
lo=find(VG==-40);
    
for i=1:length(VD)
for j=1:length(VG)
y1=-Data(i,length(VG));
yfit(:,j)=gm(i,j)*(VG-x1)+y1;
   yactual=(-Data(i,:))';
  SSE(i,j)=sum(yfit(lo:hi,j)-yactual(lo:hi))^2;
end
    
end
    
Surface(k).FitSatVT=VT;
Surface(k).FitSatMobility=mobility;
Surface(k).FitSatSSE=SSE;
 
 end
save(StructPath, 'Surface');
end
