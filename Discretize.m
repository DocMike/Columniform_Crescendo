function []=Discretize(StructPath)

load(StructPath);

for i=1:length(Transfer)
    temp=0;
    maxVal=10*ceil(Transfer(i).VG(1)/10);
    minVal=10*floor(Transfer(i).VG(end)/10);
    Range=(maxVal-10:10:minVal+10);
    Range=Range(2:end-1);
 
    counter=1;
    target=Range(counter);
    for j=1:length(Transfer(i).VG)
        
        CheckVDS=isequal(target, floor(Transfer(i).VG(j)));
        if CheckVDS==1
            temp(counter)=j;
            if counter<length(Range)
                counter=counter+1;
                target=Range(counter);
            end
        end
    end

   temp=[temp, length(Transfer(i).VG)];
 
 
       for j=1:length(Range)
           Transfer(i).ID5(j)=Transfer(i).ID(temp(j));
       end
   
   Transfer(i).VG5=Range;
end

save(StructPath, 'Transfer');

    
    
end
    


