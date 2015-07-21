function Surface=CurveFits(StructPath)

load(StructPath);
 for i=1:3%ength(Surface)
    
    W=Surface(i).Width;
    L=Surface(i).Length;
    C=Surface(i).Capacitance;
    
    for j=1:length(Surface(i).VD)
        VD=Surface(i).VD(j);
        VG=Surface(i).VG;
        ID=-Surface(i).Data(j, 1:end);
        
        options=optimoptions(@lsqcurvefit, 'alg','levenberg-marquardt',  'MaxIter', 4000, 'MaxFunEvals', 6000, 'Display', 'none', 'TolFun', 1e-6); 

        %Linear with Contact Resistance   
   
             F = @(param,VGdata) LinDinDin(param, VGdata, W, L, VD, C)
            x0 = [1 1 1];

            [param,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,VG,ID, [], [], options);

            Surface(i).RCLinRc(j)=param(2);
            Surface(i).RCLinVT(j)=param(3);
            Surface(i).RCLinMob(j)=param(1);

        %Linear without Contact Resistance

             F = @(param,VGdata) param(1)*C*W/L*(VGdata-param(2))*VD;
             x0 = [1 1];

            [param,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,VG,ID, [], [], options);

            Surface(i).LinVT(j)=param(2);
            Surface(i).LinMob(j)=param(1);

        %Satution without Contact Resistance

            F = @(param,VGdata) W*C/(2*L)*param(1)*(VGdata-param(2)).^2;
            x0 = [1 1];

            [param,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,VG,ID, [], [], options);

            Surface(i).SatVT(j)=param(2);
            Surface(i).SatMob(j)=param(1);

        %Linear without Contact Resistance with non-ideality

            F = @(param,VGdata) -param(1)*C*W/L*abs((VGdata-param(2))).^(param(3))*VD;
            x0 = [1 1 1];

            [param,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,VG,ID, [], [], options);

            Surface(i).GammaLinVT(j)=param(2);
            Surface(i).GammaLinMob(j)=param(1);
            Surface(i).GammaLinGamma(j)=param(3);

        %Satution without Contact Resistance with non-idealty

            F = @(param,VGdata) W*C/((param(3)+1)*L)*param(1)*abs((VGdata-param(2))).^(param(3)+1);
            x0 = [1 1 1];

            [param,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,VG,ID, [], [], options);

            Surface(i).GammaSatVT(j)=param(2);
            Surface(i).GammaSatMob(j)=param(1);
            Surface(i).GammaSatGamma(j)=param(3);
     
        %Linear without Contact Resistance with field effect dependence

            F = @(param,VGdata) param(1)*C*W/L*abs((VGdata-param(2))).^(2*param(2)+1)*VD;
            x0 = [1 1 1];

            [param,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,VG,ID, [], [], options);

            Surface(i).BetaLinVT(j)=param(2);
            Surface(i).BetaLink(j)=param(1);
            Surface(i).BetaLinMob(j).Mob=param(1)*abs((VG-param(2))).^(2*param(3));
            Surface(i).BetaLinBeta=param(3);

        %Satution without Contact Resistance with field effect dependence

            F = @(param,VGdata) W*C/(L*(2*param(3)+2))*param(1)*abs((VGdata-param(2))).^(2*param(3)+2);
            x0 = [1 1 1];

            [param,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,VG,ID, [], [], options);

            Surface(i).SatVT(j)=param(2);
            Surface(i).BetaSatMob(j).Mob=param(1)*abs((VG-param(2))).^(2*param(3));
            Surface(i).BetaSatk(j)=param(1);
            Surface(i).BetaSatBeta=param(3);
    
    end
end

save(StructPath, 'Surface');

end
