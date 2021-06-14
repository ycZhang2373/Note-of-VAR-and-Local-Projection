%% SW ILLUSTRATION: MONETARY POLICY
% Mikkel Plagborg-Moller & Christian K. Wolf
% This version: 05/26/2020

%% HOUSEKEEPING

clc
clear all
close all

addpath('../../_auxiliary_functions')

%% SETTINGS

%----------------------------------------------------------------
% Lags in Estimation
%----------------------------------------------------------------

settings.lags = [2 4 8 12];

%----------------------------------------------------------------
% Simulation Details
%----------------------------------------------------------------

SW_model.simul.T   = 1e5;

%----------------------------------------------------------------
% IS Characterization
%----------------------------------------------------------------

settings.VMA_hor          = 350;
settings.VAR_poplaglength = 250;
settings.IRF_hor          = 30;

%----------------------------------------------------------------
% Identifying Restrictions
%----------------------------------------------------------------

IS.shock_pos = 3;

%----------------------------------------------------------------
% Colors
%----------------------------------------------------------------

settings.colors.black  = [0 0 0];
settings.colors.grey   = [205/255 205/255 205/255];
settings.colors.orange = [204/255 102/255 0/255];

settings.colors.list = [settings.colors.black;settings.colors.grey;settings.colors.orange];

%% POPULATION VAR REPRESENTATION

%----------------------------------------------------------------
% Solve RBC Model
%----------------------------------------------------------------

% model run

dynare SW_Model noclearall
save_polfunction
clean_folder_SW

disp('I have solved and simulated the model.')

disp('Collecting model properties...')

% get law of motion for all model variables

SW_model.decision = decision(2:end,:);

% specify observables

SW_model.obs = [4 19 5]; % (y,pi,r)

% size indicators

SW_model.n_y   = size(SW_model.obs,2);
SW_model.n_eps = M_.exo_nbr; % 7 structural shocks + instrument noise
SW_model.n_s   = M_.nspred;

% ABCD representations

SW_model.ABCD = ABCD_fun_SW(SW_model);

% delete superfluous variables

clean_workspace_SW

%----------------------------------------------------------------
% Get Population IRFs + FVDs + Shock Sequences
%----------------------------------------------------------------

[SW_model.IRF,SW_model.M,SW_model.tot_weights] = pop_analysis(SW_model,settings);
SW_model.IRF(:,:,1) = SW_model.IRF(:,:,1)./SW_model.IRF(1,3,1);

disp('...done!')

%----------------------------------------------------------------
% Get VAR Representation
%----------------------------------------------------------------

disp('Getting the VAR representation...')

popVAR = popVAR(SW_model,settings);

disp('...done!')

%----------------------------------------------------------------
% Get Population IRFs
%----------------------------------------------------------------

popVAR.W = chol(popVAR.Sigma_u,'lower');

popVAR.IRF = NaN(SW_model.n_y,SW_model.n_y,settings.IRF_hor);
for i_hor = 1:settings.IRF_hor
    popVAR.IRF(:,:,i_hor) = popVAR.IRF_Wold(:,:,i_hor) * popVAR.W;
end

popVAR.IRF = squeeze(popVAR.IRF(:,IS.shock_pos,:))';
popVAR.IRF = popVAR.IRF./popVAR.IRF(1,3);

%% SIMULATION

%----------------------------------------------------------------
% Simulate Data
%----------------------------------------------------------------

SW_model.simul.eps = normrnd(0,1,SW_model.simul.T,SW_model.n_eps);

SW_model.simul.s = NaN(SW_model.simul.T,SW_model.n_s);
SW_model.simul.y = NaN(SW_model.simul.T,SW_model.n_y);
SW_model.simul.s(1,:) = SW_model.ABCD.B * SW_model.simul.eps(1,:)';
SW_model.simul.y(1,:) = SW_model.ABCD.D * SW_model.simul.eps(1,:)';
for t = 2:SW_model.simul.T
    SW_model.simul.s(t,:) = SW_model.ABCD.A * SW_model.simul.s(t-1,:)' + SW_model.ABCD.B * SW_model.simul.eps(t,:)';
    SW_model.simul.y(t,:) = SW_model.ABCD.C * SW_model.simul.s(t-1,:)' + SW_model.ABCD.D * SW_model.simul.eps(t,:)';
end

%----------------------------------------------------------------
% Recursive SVAR
%----------------------------------------------------------------

IRF.SVAR = NaN(settings.IRF_hor,length(settings.lags));

for i_lag = 1:length(settings.lags)
    
    n_lags = settings.lags(i_lag);

    [~,By,Sigma,~] = VAR(SW_model.simul.y,n_lags);
    ShockVector = chol(Sigma)';
    ShockVector = ShockVector(:,3);
    irf = IRF_SVAR(By,ShockVector,settings.IRF_hor-1);
    irf = irf ./ irf(3,1);
    IRF.SVAR(:,i_lag) = irf(1,:)';
    
end

%----------------------------------------------------------------
% Local Projection
%----------------------------------------------------------------

IRF.LP = NaN(settings.IRF_hor,length(settings.lags));

for i_lag = 1:length(settings.lags)
    
    n_lags = settings.lags(i_lag);

    irf = IRF_LP(SW_model.simul.y,2,1,n_lags,settings.IRF_hor-1);
    IRF.LP(:,i_lag) = irf';
    IRF.LP(:,i_lag) = IRF.LP(:,i_lag)./IRF.LP(2,i_lag) .* IRF.SVAR(2,i_lag);
    
end

clear By Sigma ShockVector irf i_lag n_lags t

%% SAVE RESULTS

IRF_MP    = IRF;
popVAR_MP = popVAR;

save results_MP IRF_MP popVAR_MP

