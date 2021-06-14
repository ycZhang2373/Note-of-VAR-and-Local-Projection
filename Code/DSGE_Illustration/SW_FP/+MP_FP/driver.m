%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'MP_FP';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('MP_FP.log');
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'eps_a'};
M_.exo_names_tex(1) = {'{\varepsilon_a}'};
M_.exo_names_long(1) = {'technology shock'};
M_.exo_names(2) = {'eps_u'};
M_.exo_names_tex(2) = {'{\varepsilon_u}'};
M_.exo_names_long(2) = {'monetary policy shock'};
M_.endo_names = cell(19,1);
M_.endo_names_tex = cell(19,1);
M_.endo_names_long = cell(19,1);
M_.endo_names(1) = {'pi'};
M_.endo_names_tex(1) = {'{\pi}'};
M_.endo_names_long(1) = {'inflation'};
M_.endo_names(2) = {'y_gap'};
M_.endo_names_tex(2) = {'{tilde y}'};
M_.endo_names_long(2) = {'output gap'};
M_.endo_names(3) = {'y_nat'};
M_.endo_names_tex(3) = {'{y^{nat}}'};
M_.endo_names_long(3) = {'natural output'};
M_.endo_names(4) = {'y'};
M_.endo_names_tex(4) = {'{y}'};
M_.endo_names_long(4) = {'output'};
M_.endo_names(5) = {'r_e'};
M_.endo_names_tex(5) = {'{r^{e}}'};
M_.endo_names_long(5) = {'efficient interest rate'};
M_.endo_names(6) = {'y_e'};
M_.endo_names_tex(6) = {'{y^{nat}}'};
M_.endo_names_long(6) = {'efficient output'};
M_.endo_names(7) = {'x'};
M_.endo_names_tex(7) = {'{x}'};
M_.endo_names_long(7) = {'welfare-relevant output gap'};
M_.endo_names(8) = {'r_nat'};
M_.endo_names_tex(8) = {'{r^{nat}}'};
M_.endo_names_long(8) = {'natural interest rate'};
M_.endo_names(9) = {'r_real'};
M_.endo_names_tex(9) = {'{r^r}'};
M_.endo_names_long(9) = {'real interest rate'};
M_.endo_names(10) = {'i'};
M_.endo_names_tex(10) = {'{i}'};
M_.endo_names_long(10) = {'nominal interest rate'};
M_.endo_names(11) = {'n'};
M_.endo_names_tex(11) = {'{n}'};
M_.endo_names_long(11) = {'hours worked'};
M_.endo_names(12) = {'m_growth_ann'};
M_.endo_names_tex(12) = {'{\Delta m}'};
M_.endo_names_long(12) = {'money growth'};
M_.endo_names(13) = {'u'};
M_.endo_names_tex(13) = {'{u}'};
M_.endo_names_long(13) = {'AR(1) cost push shock process'};
M_.endo_names(14) = {'a'};
M_.endo_names_tex(14) = {'{a}'};
M_.endo_names_long(14) = {'AR(1) technology shock process'};
M_.endo_names(15) = {'r_real_ann'};
M_.endo_names_tex(15) = {'{r^{r,ann}}'};
M_.endo_names_long(15) = {'annualized real interest rate'};
M_.endo_names(16) = {'i_ann'};
M_.endo_names_tex(16) = {'{i^{ann}}'};
M_.endo_names_long(16) = {'annualized nominal interest rate'};
M_.endo_names(17) = {'r_nat_ann'};
M_.endo_names_tex(17) = {'{r^{nat,ann}}'};
M_.endo_names_long(17) = {'annualized natural interest rate'};
M_.endo_names(18) = {'pi_ann'};
M_.endo_names_tex(18) = {'{\pi^{ann}}'};
M_.endo_names_long(18) = {'annualized inflation rate'};
M_.endo_names(19) = {'p'};
M_.endo_names_tex(19) = {'{p}'};
M_.endo_names_long(19) = {'price level'};
M_.endo_partitions = struct();
M_.param_names = cell(10,1);
M_.param_names_tex = cell(10,1);
M_.param_names_long = cell(10,1);
M_.param_names(1) = {'alppha'};
M_.param_names_tex(1) = {'{\alppha}'};
M_.param_names_long(1) = {'capital share'};
M_.param_names(2) = {'betta'};
M_.param_names_tex(2) = {'{\beta}'};
M_.param_names_long(2) = {'discount factor'};
M_.param_names(3) = {'rho_a'};
M_.param_names_tex(3) = {'{\rho_a}'};
M_.param_names_long(3) = {'autocorrelation technology shock'};
M_.param_names(4) = {'rho_u'};
M_.param_names_tex(4) = {'{\rho_{u}}'};
M_.param_names_long(4) = {'autocorrelation cost push shock'};
M_.param_names(5) = {'siggma'};
M_.param_names_tex(5) = {'{\sigma}'};
M_.param_names_long(5) = {'log utility'};
M_.param_names(6) = {'phi'};
M_.param_names_tex(6) = {'{\phi}'};
M_.param_names_long(6) = {'unitary Frisch elasticity'};
M_.param_names(7) = {'phi_y'};
M_.param_names_tex(7) = {'{\phi_{y}}'};
M_.param_names_long(7) = {'output feedback Taylor Rule'};
M_.param_names(8) = {'eta'};
M_.param_names_tex(8) = {'{\eta}'};
M_.param_names_long(8) = {'semi-elasticity of money demand'};
M_.param_names(9) = {'epsilon'};
M_.param_names_tex(9) = {'{\epsilon}'};
M_.param_names_long(9) = {'demand elasticity'};
M_.param_names(10) = {'theta'};
M_.param_names_tex(10) = {'{\theta}'};
M_.param_names_long(10) = {'Calvo parameter'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 19;
M_.param_nbr = 10;
M_.orig_endo_nbr = 19;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 19;
M_.eq_nbr = 19;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 6 25;
 0 7 0;
 0 8 0;
 1 9 0;
 0 10 0;
 0 11 26;
 0 12 27;
 0 13 0;
 0 14 0;
 2 15 0;
 0 16 0;
 0 17 0;
 3 18 0;
 4 19 28;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 0;
 5 24 0;]';
M_.nstatic = 11;
M_.nfwrd   = 3;
M_.npred   = 4;
M_.nboth   = 1;
M_.nsfwrd   = 4;
M_.nspred   = 5;
M_.ndynamic   = 8;
M_.dynamic_tmp_nbr = [4; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'r_e' ;
  2 , 'name' , 'y_e' ;
  3 , 'name' , 'y_gap' ;
  4 , 'name' , 'pi' ;
  5 , 'name' , 'x' ;
  6 , 'name' , 'r_nat' ;
  7 , 'name' , 'r_real' ;
  8 , 'name' , 'y_nat' ;
  9 , 'name' , '9' ;
  10 , 'name' , 'u' ;
  11 , 'name' , 'a' ;
  12 , 'name' , 'y' ;
  13 , 'name' , 'm_growth_ann' ;
  14 , 'name' , 'i_ann' ;
  15 , 'name' , 'r_real_ann' ;
  16 , 'name' , 'r_nat_ann' ;
  17 , 'name' , 'pi_ann' ;
  18 , 'name' , '18' ;
  19 , 'name' , 'i' ;
};
M_.mapping.pi.eqidx = [4 5 7 13 17 18 19 ];
M_.mapping.y_gap.eqidx = [3 9 ];
M_.mapping.y_nat.eqidx = [3 8 9 ];
M_.mapping.y.eqidx = [9 12 13 ];
M_.mapping.r_e.eqidx = [1 5 19 ];
M_.mapping.y_e.eqidx = [1 2 3 ];
M_.mapping.x.eqidx = [3 4 5 ];
M_.mapping.r_nat.eqidx = [6 16 ];
M_.mapping.r_real.eqidx = [7 15 ];
M_.mapping.i.eqidx = [5 7 13 14 19 ];
M_.mapping.n.eqidx = [12 ];
M_.mapping.m_growth_ann.eqidx = [13 ];
M_.mapping.u.eqidx = [4 10 ];
M_.mapping.a.eqidx = [2 6 8 11 12 ];
M_.mapping.r_real_ann.eqidx = [15 ];
M_.mapping.i_ann.eqidx = [14 ];
M_.mapping.r_nat_ann.eqidx = [16 ];
M_.mapping.pi_ann.eqidx = [17 ];
M_.mapping.p.eqidx = [18 ];
M_.mapping.eps_a.eqidx = [11 ];
M_.mapping.eps_u.eqidx = [10 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [4 10 13 14 19 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(19, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(10, 1);
M_.endo_trends = struct('deflator', cell(19, 1), 'log_deflator', cell(19, 1), 'growth_factor', cell(19, 1), 'log_growth_factor', cell(19, 1));
M_.NNZDerivatives = [58; 0; -1; ];
M_.static_tmp_nbr = [3; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(5) = 1;
siggma = M_.params(5);
M_.params(6) = 1;
phi = M_.params(6);
M_.params(7) = 0.125;
phi_y = M_.params(7);
M_.params(10) = 0.6666666666666666;
theta = M_.params(10);
M_.params(4) = 0;
rho_u = M_.params(4);
M_.params(3) = 0.9;
rho_a = M_.params(3);
M_.params(2) = 0.99;
betta = M_.params(2);
M_.params(8) = 4;
eta = M_.params(8);
M_.params(1) = 0.3333333333333333;
alppha = M_.params(1);
M_.params(9) = 6;
epsilon = M_.params(9);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(2, 2) = 1;
options_.irf = 0;
options_.order = 1;
options_.periods = 200;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
var_list_ = {};
dynasave('simudata.mat',var_list_);
save('MP_FP_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('MP_FP_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('MP_FP_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('MP_FP_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('MP_FP_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('MP_FP_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('MP_FP_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
