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
M_.fname = 'SW_Model';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('SW_Model.log');
M_.exo_names = cell(7,1);
M_.exo_names_tex = cell(7,1);
M_.exo_names_long = cell(7,1);
M_.exo_names(1) = {'em'};
M_.exo_names_tex(1) = {'em'};
M_.exo_names_long(1) = {'em'};
M_.exo_names(2) = {'ea'};
M_.exo_names_tex(2) = {'ea'};
M_.exo_names_long(2) = {'ea'};
M_.exo_names(3) = {'eb'};
M_.exo_names_tex(3) = {'eb'};
M_.exo_names_long(3) = {'eb'};
M_.exo_names(4) = {'eqs'};
M_.exo_names_tex(4) = {'eqs'};
M_.exo_names_long(4) = {'eqs'};
M_.exo_names(5) = {'eg'};
M_.exo_names_tex(5) = {'eg'};
M_.exo_names_long(5) = {'eg'};
M_.exo_names(6) = {'epinf'};
M_.exo_names_tex(6) = {'epinf'};
M_.exo_names_long(6) = {'epinf'};
M_.exo_names(7) = {'ew'};
M_.exo_names_tex(7) = {'ew'};
M_.exo_names_long(7) = {'ew'};
M_.endo_names = cell(33,1);
M_.endo_names_tex = cell(33,1);
M_.endo_names_long = cell(33,1);
M_.endo_names(1) = {'ewma'};
M_.endo_names_tex(1) = {'ewma'};
M_.endo_names_long(1) = {'ewma'};
M_.endo_names(2) = {'epinfma'};
M_.endo_names_tex(2) = {'epinfma'};
M_.endo_names_long(2) = {'epinfma'};
M_.endo_names(3) = {'yf'};
M_.endo_names_tex(3) = {'yf'};
M_.endo_names_long(3) = {'yf'};
M_.endo_names(4) = {'y'};
M_.endo_names_tex(4) = {'y'};
M_.endo_names_long(4) = {'y'};
M_.endo_names(5) = {'r'};
M_.endo_names_tex(5) = {'r'};
M_.endo_names_long(5) = {'r'};
M_.endo_names(6) = {'a'};
M_.endo_names_tex(6) = {'a'};
M_.endo_names_long(6) = {'a'};
M_.endo_names(7) = {'b'};
M_.endo_names_tex(7) = {'b'};
M_.endo_names_long(7) = {'b'};
M_.endo_names(8) = {'g'};
M_.endo_names_tex(8) = {'g'};
M_.endo_names_long(8) = {'g'};
M_.endo_names(9) = {'qs'};
M_.endo_names_tex(9) = {'qs'};
M_.endo_names_long(9) = {'qs'};
M_.endo_names(10) = {'ms'};
M_.endo_names_tex(10) = {'ms'};
M_.endo_names_long(10) = {'ms'};
M_.endo_names(11) = {'spinf'};
M_.endo_names_tex(11) = {'spinf'};
M_.endo_names_long(11) = {'spinf'};
M_.endo_names(12) = {'sw'};
M_.endo_names_tex(12) = {'sw'};
M_.endo_names_long(12) = {'sw'};
M_.endo_names(13) = {'kpf'};
M_.endo_names_tex(13) = {'kpf'};
M_.endo_names_long(13) = {'kpf'};
M_.endo_names(14) = {'kp'};
M_.endo_names_tex(14) = {'kp'};
M_.endo_names_long(14) = {'kp'};
M_.endo_names(15) = {'cf'};
M_.endo_names_tex(15) = {'cf'};
M_.endo_names_long(15) = {'cf'};
M_.endo_names(16) = {'invef'};
M_.endo_names_tex(16) = {'invef'};
M_.endo_names_long(16) = {'invef'};
M_.endo_names(17) = {'c'};
M_.endo_names_tex(17) = {'c'};
M_.endo_names_long(17) = {'c'};
M_.endo_names(18) = {'inve'};
M_.endo_names_tex(18) = {'inve'};
M_.endo_names_long(18) = {'inve'};
M_.endo_names(19) = {'pinf'};
M_.endo_names_tex(19) = {'pinf'};
M_.endo_names_long(19) = {'pinf'};
M_.endo_names(20) = {'w'};
M_.endo_names_tex(20) = {'w'};
M_.endo_names_long(20) = {'w'};
M_.endo_names(21) = {'lab'};
M_.endo_names_tex(21) = {'lab'};
M_.endo_names_long(21) = {'lab'};
M_.endo_names(22) = {'zcapf'};
M_.endo_names_tex(22) = {'zcapf'};
M_.endo_names_long(22) = {'zcapf'};
M_.endo_names(23) = {'rkf'};
M_.endo_names_tex(23) = {'rkf'};
M_.endo_names_long(23) = {'rkf'};
M_.endo_names(24) = {'kf'};
M_.endo_names_tex(24) = {'kf'};
M_.endo_names_long(24) = {'kf'};
M_.endo_names(25) = {'pkf'};
M_.endo_names_tex(25) = {'pkf'};
M_.endo_names_long(25) = {'pkf'};
M_.endo_names(26) = {'labf'};
M_.endo_names_tex(26) = {'labf'};
M_.endo_names_long(26) = {'labf'};
M_.endo_names(27) = {'wf'};
M_.endo_names_tex(27) = {'wf'};
M_.endo_names_long(27) = {'wf'};
M_.endo_names(28) = {'rrf'};
M_.endo_names_tex(28) = {'rrf'};
M_.endo_names_long(28) = {'rrf'};
M_.endo_names(29) = {'mc'};
M_.endo_names_tex(29) = {'mc'};
M_.endo_names_long(29) = {'mc'};
M_.endo_names(30) = {'zcap'};
M_.endo_names_tex(30) = {'zcap'};
M_.endo_names_long(30) = {'zcap'};
M_.endo_names(31) = {'rk'};
M_.endo_names_tex(31) = {'rk'};
M_.endo_names_long(31) = {'rk'};
M_.endo_names(32) = {'k'};
M_.endo_names_tex(32) = {'k'};
M_.endo_names_long(32) = {'k'};
M_.endo_names(33) = {'pk'};
M_.endo_names_tex(33) = {'pk'};
M_.endo_names_long(33) = {'pk'};
M_.endo_partitions = struct();
M_.param_names = cell(43,1);
M_.param_names_tex = cell(43,1);
M_.param_names_long = cell(43,1);
M_.param_names(1) = {'curvw'};
M_.param_names_tex(1) = {'curvw'};
M_.param_names_long(1) = {'curvw'};
M_.param_names(2) = {'cgy'};
M_.param_names_tex(2) = {'cgy'};
M_.param_names_long(2) = {'cgy'};
M_.param_names(3) = {'curvp'};
M_.param_names_tex(3) = {'curvp'};
M_.param_names_long(3) = {'curvp'};
M_.param_names(4) = {'constelab'};
M_.param_names_tex(4) = {'constelab'};
M_.param_names_long(4) = {'constelab'};
M_.param_names(5) = {'constepinf'};
M_.param_names_tex(5) = {'constepinf'};
M_.param_names_long(5) = {'constepinf'};
M_.param_names(6) = {'constebeta'};
M_.param_names_tex(6) = {'constebeta'};
M_.param_names_long(6) = {'constebeta'};
M_.param_names(7) = {'cmaw'};
M_.param_names_tex(7) = {'cmaw'};
M_.param_names_long(7) = {'cmaw'};
M_.param_names(8) = {'cmap'};
M_.param_names_tex(8) = {'cmap'};
M_.param_names_long(8) = {'cmap'};
M_.param_names(9) = {'calfa'};
M_.param_names_tex(9) = {'calfa'};
M_.param_names_long(9) = {'calfa'};
M_.param_names(10) = {'czcap'};
M_.param_names_tex(10) = {'czcap'};
M_.param_names_long(10) = {'czcap'};
M_.param_names(11) = {'csadjcost'};
M_.param_names_tex(11) = {'csadjcost'};
M_.param_names_long(11) = {'csadjcost'};
M_.param_names(12) = {'ctou'};
M_.param_names_tex(12) = {'ctou'};
M_.param_names_long(12) = {'ctou'};
M_.param_names(13) = {'csigma'};
M_.param_names_tex(13) = {'csigma'};
M_.param_names_long(13) = {'csigma'};
M_.param_names(14) = {'chabb'};
M_.param_names_tex(14) = {'chabb'};
M_.param_names_long(14) = {'chabb'};
M_.param_names(15) = {'cfc'};
M_.param_names_tex(15) = {'cfc'};
M_.param_names_long(15) = {'cfc'};
M_.param_names(16) = {'cindw'};
M_.param_names_tex(16) = {'cindw'};
M_.param_names_long(16) = {'cindw'};
M_.param_names(17) = {'cprobw'};
M_.param_names_tex(17) = {'cprobw'};
M_.param_names_long(17) = {'cprobw'};
M_.param_names(18) = {'cindp'};
M_.param_names_tex(18) = {'cindp'};
M_.param_names_long(18) = {'cindp'};
M_.param_names(19) = {'cprobp'};
M_.param_names_tex(19) = {'cprobp'};
M_.param_names_long(19) = {'cprobp'};
M_.param_names(20) = {'csigl'};
M_.param_names_tex(20) = {'csigl'};
M_.param_names_long(20) = {'csigl'};
M_.param_names(21) = {'clandaw'};
M_.param_names_tex(21) = {'clandaw'};
M_.param_names_long(21) = {'clandaw'};
M_.param_names(22) = {'crpi'};
M_.param_names_tex(22) = {'crpi'};
M_.param_names_long(22) = {'crpi'};
M_.param_names(23) = {'crdy'};
M_.param_names_tex(23) = {'crdy'};
M_.param_names_long(23) = {'crdy'};
M_.param_names(24) = {'cry'};
M_.param_names_tex(24) = {'cry'};
M_.param_names_long(24) = {'cry'};
M_.param_names(25) = {'crr'};
M_.param_names_tex(25) = {'crr'};
M_.param_names_long(25) = {'crr'};
M_.param_names(26) = {'crhoa'};
M_.param_names_tex(26) = {'crhoa'};
M_.param_names_long(26) = {'crhoa'};
M_.param_names(27) = {'crhoas'};
M_.param_names_tex(27) = {'crhoas'};
M_.param_names_long(27) = {'crhoas'};
M_.param_names(28) = {'crhob'};
M_.param_names_tex(28) = {'crhob'};
M_.param_names_long(28) = {'crhob'};
M_.param_names(29) = {'crhog'};
M_.param_names_tex(29) = {'crhog'};
M_.param_names_long(29) = {'crhog'};
M_.param_names(30) = {'crhols'};
M_.param_names_tex(30) = {'crhols'};
M_.param_names_long(30) = {'crhols'};
M_.param_names(31) = {'crhoqs'};
M_.param_names_tex(31) = {'crhoqs'};
M_.param_names_long(31) = {'crhoqs'};
M_.param_names(32) = {'crhoms'};
M_.param_names_tex(32) = {'crhoms'};
M_.param_names_long(32) = {'crhoms'};
M_.param_names(33) = {'crhopinf'};
M_.param_names_tex(33) = {'crhopinf'};
M_.param_names_long(33) = {'crhopinf'};
M_.param_names(34) = {'crhow'};
M_.param_names_tex(34) = {'crhow'};
M_.param_names_long(34) = {'crhow'};
M_.param_names(35) = {'ctrend'};
M_.param_names_tex(35) = {'ctrend'};
M_.param_names_long(35) = {'ctrend'};
M_.param_names(36) = {'cg'};
M_.param_names_tex(36) = {'cg'};
M_.param_names_long(36) = {'cg'};
M_.param_names(37) = {'sigma_a'};
M_.param_names_tex(37) = {'sigma\_a'};
M_.param_names_long(37) = {'sigma_a'};
M_.param_names(38) = {'sigma_b'};
M_.param_names_tex(38) = {'sigma\_b'};
M_.param_names_long(38) = {'sigma_b'};
M_.param_names(39) = {'sigma_g'};
M_.param_names_tex(39) = {'sigma\_g'};
M_.param_names_long(39) = {'sigma_g'};
M_.param_names(40) = {'sigma_qs'};
M_.param_names_tex(40) = {'sigma\_qs'};
M_.param_names_long(40) = {'sigma_qs'};
M_.param_names(41) = {'sigma_m'};
M_.param_names_tex(41) = {'sigma\_m'};
M_.param_names_long(41) = {'sigma_m'};
M_.param_names(42) = {'sigma_pinf'};
M_.param_names_tex(42) = {'sigma\_pinf'};
M_.param_names_long(42) = {'sigma_pinf'};
M_.param_names(43) = {'sigma_w'};
M_.param_names_tex(43) = {'sigma\_w'};
M_.param_names_long(43) = {'sigma_w'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 7;
M_.endo_nbr = 33;
M_.param_nbr = 43;
M_.orig_endo_nbr = 33;
M_.aux_vars = [];
M_.Sigma_e = zeros(7, 7);
M_.Correlation_matrix = eye(7, 7);
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
M_.orig_eq_nbr = 33;
M_.eq_nbr = 33;
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
 1 21 0;
 2 22 0;
 3 23 0;
 4 24 0;
 5 25 0;
 6 26 0;
 7 27 0;
 8 28 0;
 9 29 0;
 10 30 0;
 11 31 0;
 12 32 0;
 13 33 0;
 14 34 0;
 15 35 54;
 16 36 55;
 17 37 56;
 18 38 57;
 19 39 58;
 20 40 59;
 0 41 60;
 0 42 0;
 0 43 61;
 0 44 0;
 0 45 62;
 0 46 63;
 0 47 0;
 0 48 0;
 0 49 0;
 0 50 0;
 0 51 64;
 0 52 0;
 0 53 65;]';
M_.nstatic = 7;
M_.nfwrd   = 6;
M_.npred   = 14;
M_.nboth   = 6;
M_.nsfwrd   = 12;
M_.nspred   = 20;
M_.ndynamic   = 26;
M_.dynamic_tmp_nbr = [18; 0; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'a' ;
  2 , 'name' , 'zcapf' ;
  3 , 'name' , 'rkf' ;
  4 , 'name' , 'kf' ;
  5 , 'name' , 'invef' ;
  6 , 'name' , 'pkf' ;
  7 , 'name' , 'cf' ;
  8 , 'name' , 'yf' ;
  9 , 'name' , '9' ;
  10 , 'name' , 'wf' ;
  11 , 'name' , 'kpf' ;
  12 , 'name' , 'mc' ;
  13 , 'name' , 'zcap' ;
  14 , 'name' , 'rk' ;
  15 , 'name' , 'k' ;
  16 , 'name' , 'inve' ;
  17 , 'name' , 'pk' ;
  18 , 'name' , 'c' ;
  19 , 'name' , 'y' ;
  20 , 'name' , '20' ;
  21 , 'name' , 'pinf' ;
  22 , 'name' , 'w' ;
  23 , 'name' , 'r' ;
  24 , 'name' , '24' ;
  25 , 'name' , 'b' ;
  26 , 'name' , 'g' ;
  27 , 'name' , 'qs' ;
  28 , 'name' , 'ms' ;
  29 , 'name' , 'spinf' ;
  30 , 'name' , 'epinfma' ;
  31 , 'name' , 'sw' ;
  32 , 'name' , 'ewma' ;
  33 , 'name' , 'kp' ;
};
M_.mapping.ewma.eqidx = [31 32 ];
M_.mapping.epinfma.eqidx = [29 30 ];
M_.mapping.yf.eqidx = [8 9 23 ];
M_.mapping.y.eqidx = [19 20 23 ];
M_.mapping.r.eqidx = [17 18 23 ];
M_.mapping.a.eqidx = [1 9 12 20 24 ];
M_.mapping.b.eqidx = [6 7 17 18 25 ];
M_.mapping.g.eqidx = [8 19 26 ];
M_.mapping.qs.eqidx = [5 11 16 27 33 ];
M_.mapping.ms.eqidx = [23 28 ];
M_.mapping.spinf.eqidx = [21 29 ];
M_.mapping.sw.eqidx = [22 31 ];
M_.mapping.kpf.eqidx = [4 11 ];
M_.mapping.kp.eqidx = [15 33 ];
M_.mapping.cf.eqidx = [7 8 10 ];
M_.mapping.invef.eqidx = [5 8 11 ];
M_.mapping.c.eqidx = [18 19 22 ];
M_.mapping.inve.eqidx = [16 19 33 ];
M_.mapping.pinf.eqidx = [17 18 21 22 23 ];
M_.mapping.w.eqidx = [12 14 22 ];
M_.mapping.lab.eqidx = [14 18 20 22 ];
M_.mapping.zcapf.eqidx = [2 4 8 ];
M_.mapping.rkf.eqidx = [1 2 3 6 ];
M_.mapping.kf.eqidx = [3 4 9 ];
M_.mapping.pkf.eqidx = [5 6 ];
M_.mapping.labf.eqidx = [3 7 9 10 ];
M_.mapping.wf.eqidx = [1 3 10 ];
M_.mapping.rrf.eqidx = [6 7 ];
M_.mapping.mc.eqidx = [12 21 ];
M_.mapping.zcap.eqidx = [13 15 19 ];
M_.mapping.rk.eqidx = [12 13 14 17 ];
M_.mapping.k.eqidx = [14 15 20 ];
M_.mapping.pk.eqidx = [16 17 ];
M_.mapping.em.eqidx = [28 ];
M_.mapping.ea.eqidx = [24 26 ];
M_.mapping.eb.eqidx = [25 ];
M_.mapping.eqs.eqidx = [27 ];
M_.mapping.eg.eqidx = [26 ];
M_.mapping.epinf.eqidx = [30 ];
M_.mapping.ew.eqidx = [32 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 ];
M_.exo_names_orig_ord = [1:7];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(33, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(7, 1);
M_.params = NaN(43, 1);
M_.endo_trends = struct('deflator', cell(33, 1), 'log_deflator', cell(33, 1), 'growth_factor', cell(33, 1), 'log_growth_factor', cell(33, 1));
M_.NNZDerivatives = [142; 0; -1; ];
M_.static_tmp_nbr = [16; 2; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(12) = .025;
ctou = M_.params(12);
M_.params(21) = 1.5;
clandaw = M_.params(21);
M_.params(36) = 0.18;
cg = M_.params(36);
M_.params(3) = 10;
curvp = M_.params(3);
M_.params(1) = 10;
curvw = M_.params(1);
M_.params(9) = 0.2024;
calfa = M_.params(9);
cbeta	     = 0.9995;
M_.params(13) = 1.2679;
csigma = M_.params(13);
M_.params(15) = 1.6670;
cfc = M_.params(15);
M_.params(2) = 0.5881;
cgy = M_.params(2);
M_.params(11) = 6.3144;
csadjcost = M_.params(11);
M_.params(14) = 0.8056;
chabb = M_.params(14);
M_.params(17) = 0.7668;
cprobw = M_.params(17);
M_.params(20) = 2.5201;
csigl = M_.params(20);
M_.params(19) = 0.5304;
cprobp = M_.params(19);
M_.params(16) = 0.5345;
cindw = M_.params(16);
M_.params(18) = 0.1779;
cindp = M_.params(18);
M_.params(10) = 0.3597;
czcap = M_.params(10);
M_.params(22) = 1.8685;
crpi = M_.params(22);
M_.params(25) = 0.8739;
crr = M_.params(25);
M_.params(24) = 0.1203;
cry = M_.params(24);
M_.params(23) = 0.1282;
crdy = M_.params(23);
M_.params(26) = 0.9826;
crhoa = M_.params(26);
M_.params(28) = 0.1391;
crhob = M_.params(28);
M_.params(29) = 0.7;
crhog = M_.params(29);
M_.params(30) = 0.9928;
crhols = M_.params(30);
M_.params(31) = 0.6121;
crhoqs = M_.params(31);
M_.params(27) = 1;
crhoas = M_.params(27);
M_.params(32) = 0.1999;
crhoms = M_.params(32);
M_.params(33) = 0.9856;
crhopinf = M_.params(33);
M_.params(34) = 0.9818;
crhow = M_.params(34);
M_.params(8) = 0.8340;
cmap = M_.params(8);
M_.params(7) = 0.9337;
cmaw = M_.params(7);
M_.params(4) = 1.3263;
constelab = M_.params(4);
M_.params(5) = 0.6365;
constepinf = M_.params(5);
M_.params(6) = 0.1126;
constebeta = M_.params(6);
M_.params(35) = 0.5113;
ctrend = M_.params(35);
M_.params(37) = 0.5017;
sigma_a = M_.params(37);
M_.params(38) = 0.3583;
sigma_b = M_.params(38);
M_.params(39) = 0.6752;
sigma_g = M_.params(39);
M_.params(40) = 0.5678;
sigma_qs = M_.params(40);
M_.params(41) = 0.2290;
sigma_m = M_.params(41);
M_.params(42) = 0.2181;
sigma_pinf = M_.params(42);
M_.params(43) = 0.2663;
sigma_w = M_.params(43);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.Sigma_e(4, 4) = (1)^2;
M_.Sigma_e(5, 5) = (1)^2;
M_.Sigma_e(6, 6) = (1)^2;
M_.Sigma_e(7, 7) = (1)^2;
options_.irf = 0;
options_.order = 1;
options_.periods = 200;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
save('SW_Model_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('SW_Model_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('SW_Model_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('SW_Model_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('SW_Model_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('SW_Model_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('SW_Model_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off