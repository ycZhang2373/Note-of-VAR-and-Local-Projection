%% GERTLER-KARADI APPLICATION
% Mikkel Plagborg-Moller & Christian K. Wolf
% This version: 05/26/2020
% Edited by Xinyi Zhang: 06/08/2021
%% HOUSEKEEPING

clc
clear all
close all

% pwd: Store Path to MATLAB Current Folder
path = pwd;

cd(path);
addpath('../_auxiliary_functions')

%% LOAD DATA

Data;
% T: time range, ny: number of endo variables(y)
[T,ny] = size(Y);

%% SETTINGS

% Variable indices
iy = ny; % position of Response Variable (5)
ix = 1; % position of Exogenous Shock

% Horizons to plot
maxhorz = 36;

% Lag lengths to plot
% ps = [12 24]; % Exogenously compute results for these lag lengths
p_max_ic = 24; % Max lag length for AIC/BIC

% Plot settings
plot_xticks = 0:6:36;
plot_ylim = [-3.5 3.5];

%% ESTIMATION

%----------------------------------------------------------------
% Information Criteria
%----------------------------------------------------------------

[BIC,AIC] = IC_VAR(data,p_max_ic);
[~,p_BIC] = min(BIC);
[~,p_AIC] = min(AIC);

%----------------------------------------------------------------
% Estimate: Recursive VAR, LP-IV, SVAR-IV
%----------------------------------------------------------------

% ps_expand = unique([ps p_BIC p_AIC]); % List of all lag lengths to consider
ps_expand = [4 6 8 10 12]; % List of all lag lengths to consider
np = length(ps_expand);

% Store IRF of x to y under different lags
irfs_var = zeros(np,maxhorz+1);
irfs_lpiv = zeros(np,maxhorz+1);
irfs_svariv = zeros(np,maxhorz+1);

for i_p=1:np % For each lag length...
    
    % Lag length 
    the_p = ps_expand(i_p);
    
    % VAR with IV ordered first
    [~,the_By_full,the_Sigma_full,~,the_res_full] = VAR_mod([Z Y],the_p); % VAR w. IV
    the_chol = chol(the_Sigma_full)'; % Impact impulse responses
    % the_By_full: the coefficient matrix of different lags
    % u1 = a11*e1, u2 = a21*e1 + a21*e2.... (only e1 is shock)
    the_irf_var = IRF_SVAR(the_By_full,the_chol(:,1),maxhorz);
    % iy: 5 control variables, ix: 1 exogenous shocks
    % normalization，认为冲击=1而不是Choleskey的系数
    irfs_var(i_p,:) = the_irf_var(1+iy,:)/the_irf_var(1+ix,1);
    
    % LP-IV
       % Y(:,setdiff(1:ny,[ix iy])) = Y - Y(:,ix) - Y(:,iy)
    irfs_lpiv(i_p,:) = IRF_LP_IV([Z Y(:,ix) Y(:,iy) Y(:,setdiff(1:ny,[ix iy]))],2,1,the_p,maxhorz);
    
    % Y = Y((horizon + nlags + 1):end, respV)
    % X = X((horizon + nlags + 1):end,[1:(dimR+1),(nv + 1):((nlags + 1) * nv)])

%     % SVAR-IV
%     Ztilde = the_res_full(:,1); % Residualized IV
%     [~,the_By,~,~,the_res] = VAR_mod(Y,the_p); % VAR w/o IV
%     the_irf_svariv = IRF_SVAR(the_By,the_res'*Ztilde/(T-the_p),maxhorz); % SVAR-IV IRFs
%     irfs_svariv(i_p,:) = the_irf_svariv(iy,:)/the_irf_svariv(ix,1);
    
end

%% PLOT

%----------------------------------------------------------------
% Preparations
%----------------------------------------------------------------

settings.colors.black  = [0 0 0];
settings.colors.grey   = [205/255 205/255 205/255];
settings.colors.orange = [204/255 102/255 0/255];
settings.colors.green  = [37/255 152/255 14/255];
settings.colors.blue   = [51/255 51/255 255/255];
settings.colors.red    = [255/255 0/255 0/255];

settings.colors.list = [settings.colors.black;settings.colors.grey;settings.colors.orange];

maxhorz = 24;

% index_p to choose lag -- ps_expand = [4 6 8 10 12]
indx_p_1 = 1;  % p = 4
indx_p_2 = 5;  % p = 12

plotwidth = 0.4;
gapsize = 0.1;
gapsize_edges = (1-2*plotwidth-1*gapsize)/2;
left_pos = [gapsize_edges, gapsize_edges + gapsize + plotwidth];

%----------------------------------------------------------------
% Plot
%----------------------------------------------------------------

figure(1)
subplot(1,2,1)
pos = get(gca, 'Position');
pos(1) = left_pos(1);
pos(3) = plotwidth;
set(gca,'Position', pos)
hold on
plot(0:1:maxhorz,irfs_var(indx_p_1,1:maxhorz+1),'Color',settings.colors.blue,'LineWidth',3,'LineStyle',':')
hold on
plot(0:1:maxhorz,irfs_lpiv(indx_p_1,1:maxhorz+1),'Color',settings.colors.red,'LineWidth',3,'LineStyle','--')
hold on
plot([ps_expand(indx_p_1) ps_expand(indx_p_1)],plot_ylim,'Color',settings.colors.black,'LineStyle','-','LineWidth',2)
hold on
set(gcf,'color','w')
title('$p$ = 4','interpreter','latex','fontsize',22)
xlabel('Horizon (monthly)','interpreter','latex','FontSize',20)
ylabel('\% deviation','interpreter','latex','FontSize',20)
xlim([0 maxhorz])
ylim(plot_ylim)
grid on
hold off

subplot(1,2,2)
pos = get(gca, 'Position');
pos(1) = left_pos(2);
pos(3) = plotwidth;
set(gca,'Position', pos)
hold on
plot(0:1:maxhorz,irfs_var(indx_p_2,1:maxhorz+1),'Color',settings.colors.blue,'LineWidth',3,'LineStyle',':')
hold on
plot(0:1:maxhorz,irfs_lpiv(indx_p_2,1:maxhorz+1),'Color',settings.colors.red,'LineWidth',3,'LineStyle','--')
hold on
plot([ps_expand(indx_p_2) ps_expand(indx_p_2)],plot_ylim,'Color',settings.colors.black,'LineStyle','-','LineWidth',2)
hold on
set(gcf,'color','w')
title('$p$ = 12','interpreter','latex','fontsize',22)
xlabel('Horizon (monthly)','interpreter','latex','FontSize',20)
ylabel('\% deviation','interpreter','latex','FontSize',20)
legend({'SVAR','LP'},'Location','Northeast','fontsize',20,'interpreter','latex')
xlim([0 maxhorz])
ylim(plot_ylim)
grid on
hold off
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) 1.75*pos(3) 1.075*pos(4)]);
set(gcf, 'PaperPositionMode', 'auto');
print('GK_Illustr','-depsc');