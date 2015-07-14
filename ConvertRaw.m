function [Data, VD, VG]=ConvertRaw(M)


StartVD=max(M.data(:,2));
EndVD=min(M.data(:,2));
StartVG=M.data(1,4);
EndVG=M.data(end,4);

%Finds the index of the first set of VD values
indexStartVD=find(M.data(:,2)==StartVD);
indexStartVD=indexStartVD(1);
indexEndVD=find(M.data(:,2)==EndVD);
indexEndVD=indexEndVD(1);

%Finds number of data points of thi sample
point=indexEndVD-indexStartVD;

%Finds VD array
VD=M.data(1:1+point,2);

index=1;
%Generate Matrix of Data with the rows containing constant VDS and columns constant VGS
for i=1:(length(M.data)/(point+1))
    temp=M.data(index:index+point,3);
    index=index+point+1;
    if i==1
        Data=temp;
    else 
        Data=[Data, temp];
    end
    VG(i)=M.data(index-1,4);
end

end


    