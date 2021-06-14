% Load data.csv

%% SETTINGS

% Data
data_file = 'data.csv'; % Data file
sample = [datetime('1990-12-1'), datetime('2016-12-01')]; % Sample end points

% CONTROL VARIAVLES
% 1 year government bond rate
% stock price index: log S&P 500
% (output growth) log growth of Industrial Production, real GDP
% (price level) log growth of CPI, GDP deflator
% (non-default related bond spread) excess bond premium

% endo_vars = {'gs1','logsp500', 'us_ip', 'us_cpi', 'ebpnew'}; 
endo_vars = {'gs1','logsp500', 'us_rgdp', 'us_gdpdef', 'ebpnew'}; 
% External IV (z), also symbols exogenous shock
% iv_fis = 'sp500_hf';   % 2001.9.1ȱʧ
iv_mon = 'ff4_hf'; 


%% LOAD DATA
% 34 variables (endo + exo)
dat_table = readtable(data_file, 'Format', strcat('%s', repmat('%f', 1, 34))); % Read from file
% get all data in 1990-12-1 to 2016-12-01
sample_bool = datetime(dat_table.date) >= sample(1) & datetime(dat_table.date) <= sample(2); % Sample marker

time = dat_table.date(sample_bool); % Timestamps
Y = dat_table{sample_bool, endo_vars}; % Endogenous variables
Z = dat_table{sample_bool, iv_mon}; % External IV_Fiscal Policy
% Z = dat_table{sample_bool, iv_mon}; % External IV_Monetary Policy

% size(data) = [313,7]
data = [Y]; % Data matrix
