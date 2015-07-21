function mobility=PlotTransfer(StructPath)

load(StructPath)


for i=1:length(Surface)

%Let k be the index corresponding to the VDS to be analyzed. ie, k=4,
%VDS=-3
k=4

hold on

VG=Surface(i).VG
ID=Surface(i).Data(k, 1:end)
mobility(i)=Surface(i).LinConMob(k)

plot(VG,ID, Surface(i).Marker)

legendInfo{i}=Surface(i).Name;
end

legend(legendInfo)
hold off


save(StructPath, 'Surface');
end

