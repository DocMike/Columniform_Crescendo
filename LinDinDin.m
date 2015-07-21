function out=LinDinDin(param, VGdata, W, L, VD, C)


out=VD./(param(2)+1./(W/L*param(1)*C*(VGdata-param(3))));

end

