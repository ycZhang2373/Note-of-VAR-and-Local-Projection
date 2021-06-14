function [irf] = IRF_LP(Y,dimR,respV,nlags,nhorizons)

nv = size(Y,2);
nT = size(Y,1);
if (nhorizons + nlags) >= nT
    error("Number of horizons too large! No obs in sample!")
end
irf = zeros(1,nhor izons + 1);

for h = 0:nhorizons
    [Bc,Br,Bx,By,Sigma,Sxx] = LP(Y,dimR,respV,nlags,h);
    irf(1,h + 1) = Bx;
end

end