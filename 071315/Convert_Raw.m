
%Reads the entire  excell and puts NaN in the place of empty cells/text 
num = xlsread('SON1s.xlsx')

%Finds the index coordinates of the first data point
k=5

%Finds the number of data points in num matrix
numpoints=num(end,1)
endindex=find(num(:,1)==numpoints)

%Finds the voltage value of the first data point
Volt1=num(k,2)

%Finds the index coordinates of the first voltage=0 data point
j=find(num(:,2)==-80)
j=j(1)

%Finds number of data points of this sample
point=j-k

%Finds VD array
VD=num(k:k+point, 2)

%Finds VG array

%Generate Matrix of Data with the rows containing constant VDS and columns constant VGS
for i=1:(numpoints/(point+1))
   temp=num(k:k+point, 3) 
    k=k+point+1
    if i==1
    Data=temp
    else
        Data=[Data, temp]
    end
    VG(i)=num(k-1, 4)
end




