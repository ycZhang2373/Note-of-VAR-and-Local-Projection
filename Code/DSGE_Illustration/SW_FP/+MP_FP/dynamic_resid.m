function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = MP_FP.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(19, 1);
lhs = y(10);
rhs = params(5)*(y(26)-y(11));
residual(1) = lhs - rhs;
lhs = y(11);
rhs = T(1)*y(19);
residual(2) = lhs - rhs;
lhs = y(7);
rhs = y(12)+y(11)-y(8);
residual(3) = lhs - rhs;
lhs = y(6);
rhs = y(18)+params(2)*y(25)+y(12)*T(3);
residual(4) = lhs - rhs;
lhs = y(12);
rhs = T(2)*(y(15)-y(25)-y(10))+y(27);
residual(5) = lhs - rhs;
lhs = y(13);
rhs = (y(28)-y(19))*params(5)*T(1);
residual(6) = lhs - rhs;
lhs = y(14);
rhs = y(15)-y(25);
residual(7) = lhs - rhs;
lhs = y(8);
rhs = params(6)*y(19);
residual(8) = lhs - rhs;
lhs = y(7);
rhs = y(9)-y(8);
residual(9) = lhs - rhs;
lhs = y(18);
rhs = params(4)*y(3)+x(it_, 2);
residual(10) = lhs - rhs;
lhs = y(19);
rhs = params(3)*y(4)+x(it_, 1);
residual(11) = lhs - rhs;
lhs = y(9);
rhs = y(19)+(1-params(1))*y(16);
residual(12) = lhs - rhs;
lhs = y(17);
rhs = 4*(y(6)+y(9)-y(1)-params(8)*(y(15)-y(2)));
residual(13) = lhs - rhs;
lhs = y(21);
rhs = y(15)*4;
residual(14) = lhs - rhs;
lhs = y(20);
rhs = y(14)*4;
residual(15) = lhs - rhs;
lhs = y(22);
rhs = y(13)*4;
residual(16) = lhs - rhs;
lhs = y(23);
rhs = y(6)*4;
residual(17) = lhs - rhs;
lhs = y(6);
rhs = y(24)-y(5);
residual(18) = lhs - rhs;
lhs = y(15);
rhs = y(10)+y(6)*T(4);
residual(19) = lhs - rhs;

end
