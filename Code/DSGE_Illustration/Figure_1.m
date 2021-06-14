%% SW ILLUSTRATION: PLOT
% Mikkel Plagborg-Moller & Christian K. Wolf
% This version: 05/26/2020

%% HOUSEKEEPING

clc
clear all
close all

path = pwd;

cd(path);
addpath('SW_FP')
addpath('SW_MP')

%% IMPORT RESULTS

load('results_MP.mat')
load('results_FP.mat')

%% PLOT RESULTS

%----------------------------------------------------------------
% Color Preparation
%----------------------------------------------------------------

settings.colors.black  = [0 0 0];
settings.colors.grey   = [130/255 130/255 130/255];
settings.colors.orange = [204/255 102/255 0/255];
settings.colors.green = [37/255 152/255 14/255];
settings.colors.purple = [160/255 32/255 240/255];
settings.colors.blue = [51/255 51/255 255/255];
settings.colors.red = [255/255 0/255 0/255];
settings.colors.list = [settings.colors.black;settings.colors.grey;settings.colors.orange];

n = 200;

clear cmap
cmap(1,:) = [204/255,102/255,0/255];
cmap(2,:) = [1 1 1];
cmap(3,:) = [160/255,160/255,160/255];
[X,Y] = meshgrid([1:3],[1:50]);
cmap = interp2(X([1,25,50],:),Y([1,25,50],:),cmap,X,Y);

%----------------------------------------------------------------
% Settings
%----------------------------------------------------------------

IRF_plot = 16;
indx_lag = 2;

lags_list = [2 4 8 12];
n_lags    = lags_list(indx_lag);

scale_FP = 1/max(abs(IRF_FP.LP(1:IRF_plot+1,end)));
scale_MP = -1/max(abs(IRF_MP.LP(1:IRF_plot+1,end)));

%----------------------------------------------------------------
% Plot
%----------------------------------------------------------------

plotwidth = 0.4;
gapsize = 0.08;
gapsize_edges = (1-2*plotwidth-1*gapsize)/2;
left_pos = [gapsize_edges, gapsize_edges + gapsize + plotwidth];

figure(1)
subplot(1,2,1)
pos = get(gca, 'Position');
pos(1) = left_pos(1);
pos(3) = plotwidth;
set(gca,'Position', pos)
set(gca,'FontSize',14)
hold on
plot(0:1:IRF_plot,scale_FP*IRF_FP.LP(1:IRF_plot+1,end),'linewidth',3,'linestyle','-','color',settings.colors.black)
hold on
plot(0:1:IRF_plot,scale_FP*IRF_FP.LP(1:IRF_plot+1,indx_lag),'linewidth',3,'linestyle','--','color',settings.colors.red)
hold on
plot(0:1:IRF_plot,scale_FP*IRF_FP.SVAR(1:IRF_plot+1,indx_lag),'linewidth',3,'linestyle',':','color',settings.colors.blue)
hold on
plot([n_lags n_lags],[-3 2],'Color',settings.colors.black,'LineWidth',2,'LineStyle','-')
hold on
set(gcf,'color','w')
title('Fiscal Policy, Output Response','interpreter','latex','fontsize',22)
xlabel('Horizon (quarterly)','interpreter','latex','FontSize',20)
ylabel('\% deviation','interpreter','latex','FontSize',20)
ylim([-0.5 1.5])
xlim([0 16])
grid on
hold off

subplot(1,2,2)
pos = get(gca, 'Position');
pos(1) = left_pos(2);
pos(3) = plotwidth;
set(gca,'Position', pos)
set(gca,'FontSize',14)
hold on
plot(0:1:IRF_plot,scale_MP*IRF_MP.LP(1:IRF_plot+1,end),'linewidth',3,'linestyle','-','color',settings.colors.black)
hold on
plot(0:1:IRF_plot,scale_MP*IRF_MP.LP(1:IRF_plot+1,indx_lag),'linewidth',3,'linestyle','--','color',settings.colors.red)
hold on
plot(0:1:IRF_plot,scale_MP*IRF_MP.SVAR(1:IRF_plot+1,indx_lag),'linewidth',3,'linestyle',':','color',settings.colors.blue)
hold on
plot([n_lags n_lags],[-3 2],'Color',settings.colors.black,'LineWidth',2,'LineStyle','-')
hold on
set(gcf,'color','w')
title('Monetary Policy, Output Response','interpreter','latex','fontsize',22)
xlabel('Horizon (quarterly)','interpreter','latex','FontSize',20)
ylabel('\% deviation','interpreter','latex','FontSize',20)
legend({'SVAR($\infty$)/LP($\infty$)','LP($p$)','SVAR($p$)'},'Location','Southeast','fontsize',20,'interpreter','latex')
ylim([-0.5 1.5])
xlim([0 16])
grid on
hold off
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) 1.75*pos(3) 1.075*pos(4)]);
set(gcf, 'PaperPositionMode', 'auto');
print(['SW_Illustr_' num2str(n_lags)],'-depsc');