function [firstStage,secondStage] = LP_IV(H,respV,normlzV,nlags,horizon)

% ix = 1, iy = ny
% H = [Z Y(:,ix) Y(:,iy) Y(:,setdiff(1:ny,[ix iy]))]
% respV = 2
% normlzV = 1
% nlags = the_p   % nhorizons = maxhorz

Z = H(:,1); % h = (r,x,y,q(3))
Y = H(:,2:end);
nv = size(Y,2); % nv = 5
nT = size(Y,1);

% first stage
X = lagmatrix(H,1:nlags);
X = [ones(nT,1),Z,X];
Y = Y((nlags + 1):end, normlzV); % [x_t,.....]
X = X((nlags + 1):end,:); % [1, z_t, z_{t-1}, y_{t-1}, ..., z_{t-p}, y_{t-p}]
[Beta,Sigma,Sxx,~] = LS(Y,X);

firstStage.Bc = Beta(1,1);
firstStage.Bz = Beta(2,1);
By = Beta(3:end,1);
firstStage.By = reshape(By,[nv+1,nlags]);  
firstStage.Sigma = Sigma;
firstStage.Sxx = Sxx;

% second stage
Y = H(:,2:end);
X = lagmatrix(H,horizon + (1:nlags));
X = [ones(nT,1),lagmatrix(Z,horizon),X];
Y = Y((horizon + nlags + 1):end, respV); % [y_t,.....]
X = X((horizon + nlags + 1):end,:); % [1, z_{t-h}, z_{t-h-1}, y_{t-h-1}, ..., z_{t-h-p}, y_{t-h-p}]
[Beta,Sigma,Sxx,~] = LS(Y,X);

secondStage.Bc = Beta(1,1);
secondStage.Bz = Beta(2,1);
By = Beta(3:end,1);
secondStage.By = reshape(By,[nv+1,nlags]);
secondStage.Sigma = Sigma;
secondStage.Sxx = Sxx;
    
end

