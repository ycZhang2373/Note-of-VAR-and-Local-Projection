function [irf] = IRF_LP_IV(H,respV,normlzV,nlags,nhorizons)

% ix = 1, iy = ny
% H = [Z Y(:,ix) Y(:,iy) Y(:,setdiff(1:ny,[ix iy]))]
% respV = 2
% normlzV = 1
% nlags = the_p   % nhorizons = maxhorz

nv = size(H,2) - 1;
nT = size(H,1);
if (nhorizons + nlags) >= nT
    error("Number of horizons too large! No obs in sample!")
end
irf = zeros(1, nhorizons + 1);

for h = 0:nhorizons
    [firstStage,secondStage] = LP_IV(H,respV,normlzV,nlags,h);
    irf(1,h + 1) = secondStage.Bz / firstStage.Bz;
end

end

