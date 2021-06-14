function [Bc,Br,Bx,By,Sigma,Sxx] = LP(Y,dimR,respV,nlags,horizon)

nv = size(Y,2); % order (r,x,y,q)
    
X = lagmatrix(Y,horizon + (0:nlags));
Y = Y((horizon + nlags + 1):end, respV);
X = X((horizon + nlags + 1):end,[1:(dimR+1),(nv + 1):((nlags + 1) * nv)]);
X = [ones(size(X,1),1),X];
[Beta,Sigma,Sxx,~] = LS(Y,X);

Bc = Beta(1,1);
if dimR==0
    Br = [];
else
    Br = Beta(2:(dimR + 1),1);
end
Bx = Beta(dimR + 2,1);
By = Beta((dimR + 3):end,1);
By = reshape(By,[nv,nlags]);

end

