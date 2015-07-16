function Surface=CurveFits(StructPath)

load(StructPath);
for i=1:length(Surface)
    
    W=Surface(i).Width;
    L=Surface(i).Length;
    C=Surface(i).Capacitance;
    
    for j=1:length(Surface(i).VD)
        VD=Surface(i).VD(j);
        VG=Surface(i).VG;
        ID=-Surface(i).Data(j, 1:end);
        
   options=optimoptions(@lsqcurvefit, 'alg','levenberg-marquardt',  'MaxIter', 4000, 'MaxFunEvals', 6000); 

F = @(x,xdata) VD./(x(1)+1./(W/L*x(2)*C*(xdata-x(3))));
x0 = [1 1 1];

[x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,VG,ID, [], [], options);

Surface(i).RCLinConRc(j)=x(1);
Surface(i).RCLinConVT(j)=x(3);
Surface(i).RCLinConMob(j)=x(2);

F = @(x,xdata) VD./(1./(W/L*x(1)*C*(xdata-x(2))));
x0 = [1 1];

[x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,VG,ID, [], [], options);

Surface(i).LinConVT(j)=x(2);
Surface(i).LinConMob(j)=x(1);
    end
end

save(StructPath, 'Surface');

end
