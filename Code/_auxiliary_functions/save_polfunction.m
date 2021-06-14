function save_polfunction()

% Save decision rule in readable format
% Similar to Dynare's function disp_dr.m when order=1

% M_ : save Structure containing various information about the model.
% oo_ : Structure containing the various results of the computations.
% options_ : Structure contains the values of the various options used by 
%            Dynare during the computation.
global M_ oo_ options_;
dr = oo_.dr;

% Preliminaries
if options_.block
    k1 = 1:M_.endo_nbr;
else
    k1 = dr.order_var;  % 34个内生变量对应的lag
end
% ivar is the i of VAR(p_i)，从小到大排列
[~,ivar] = sort(k1);

% Construct decision rule matrix in correct order
decision = [dr.ys(k1(ivar))'; % constant 1*34
            dr.ghx(ivar,:)';  % ghx 20*34 (20 state variables)
            dr.ghu(ivar,:)']; % ghu 7*34 (7 exogenous shock)

% Save
save polfunction decision;

end