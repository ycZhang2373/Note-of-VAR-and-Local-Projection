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
    T = SW_Model.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(33, 1);
lhs = y(26);
rhs = params(9)*y(43)+(1-params(9))*y(47);
residual(1) = lhs - rhs;
lhs = y(42);
rhs = y(43)*T(3);
residual(2) = lhs - rhs;
lhs = y(43);
rhs = y(47)+y(46)-y(44);
residual(3) = lhs - rhs;
lhs = y(44);
rhs = y(42)+y(13);
residual(4) = lhs - rhs;
lhs = y(36);
rhs = y(29)+T(8)*(y(16)+y(55)*T(7)+y(45)*1/T(10));
residual(5) = lhs - rhs;
lhs = y(45);
rhs = y(27)*1/T(12)-y(48)+y(61)*(T(4)-(1-params(12)))/T(4)+y(62)*(1-params(12))/T(4);
residual(6) = lhs - rhs;
lhs = y(35);
rhs = y(27)+y(15)*T(11)/(1+T(11))+y(54)*1/(1+T(11))+(y(46)-y(63))*T(13)-y(48)*T(12);
residual(7) = lhs - rhs;
lhs = y(23);
rhs = y(28)+y(35)*(1-params(36)-T(1)*T(5)*T(6))+y(36)*T(1)*T(5)*T(6)+y(42)*(T(4)-(1-params(12)))*T(6);
residual(8) = lhs - rhs;
lhs = y(23);
rhs = params(15)*(y(26)+params(9)*y(44)+(1-params(9))*y(46));
residual(9) = lhs - rhs;
lhs = y(47);
rhs = y(46)*params(20)+y(35)*T(14)-y(15)*T(15);
residual(10) = lhs - rhs;
lhs = y(33);
rhs = y(13)*(1-T(5))+y(36)*T(5)+y(29)*T(5)*T(10);
residual(11) = lhs - rhs;
lhs = y(49);
rhs = params(9)*y(51)+(1-params(9))*y(40)-y(26);
residual(12) = lhs - rhs;
lhs = y(50);
rhs = T(3)*y(51);
residual(13) = lhs - rhs;
lhs = y(51);
rhs = y(40)+y(41)-y(52);
residual(14) = lhs - rhs;
lhs = y(52);
rhs = y(50)+y(14);
residual(15) = lhs - rhs;
lhs = y(38);
rhs = y(29)+T(8)*(y(18)+y(57)*T(7)+y(53)*1/T(10));
residual(16) = lhs - rhs;
lhs = y(53);
rhs = y(58)-y(25)+y(27)*1/T(12)+y(64)*(T(4)-(1-params(12)))/T(4)+y(65)*(1-params(12))/T(4);
residual(17) = lhs - rhs;
lhs = y(37);
rhs = y(27)+y(17)*T(11)/(1+T(11))+y(56)*1/(1+T(11))+(y(41)-y(60))*T(13)-(y(25)-y(58))*T(12);
residual(18) = lhs - rhs;
lhs = y(24);
rhs = y(28)+y(37)*(1-params(36)-T(1)*T(5)*T(6))+y(38)*T(1)*T(5)*T(6)+y(50)*(T(4)-(1-params(12)))*T(6);
residual(19) = lhs - rhs;
lhs = y(24);
rhs = params(15)*(y(26)+params(9)*y(52)+(1-params(9))*y(41));
residual(20) = lhs - rhs;
lhs = y(39);
rhs = y(31)+T(16)*(params(18)*y(19)+y(58)*T(7)+y(49)*T(17));
residual(21) = lhs - rhs;
lhs = y(40);
rhs = y(32)+y(20)*T(8)+y(59)*T(7)/(1+T(7))+y(19)*params(16)/(1+T(7))-y(39)*(1+params(16)*T(7))/(1+T(7))+y(58)*T(7)/(1+T(7))+T(18)*(params(20)*y(41)+y(37)*T(14)-y(17)*T(15)-y(40));
residual(22) = lhs - rhs;
lhs = y(25);
rhs = y(39)*params(22)*(1-params(25))+(1-params(25))*params(24)*(y(24)-y(23))+params(23)*(y(24)-y(23)-y(4)+y(3))+params(25)*y(5)+y(30);
residual(23) = lhs - rhs;
lhs = y(26);
rhs = params(26)*y(6)+params(37)*x(it_, 2);
residual(24) = lhs - rhs;
lhs = y(27);
rhs = params(28)*y(7)+params(38)*x(it_, 3);
residual(25) = lhs - rhs;
lhs = y(28);
rhs = params(29)*y(8)+params(39)*x(it_, 5)+x(it_, 2)*params(37)*params(2);
residual(26) = lhs - rhs;
lhs = y(29);
rhs = params(31)*y(9)+params(40)*x(it_, 4);
residual(27) = lhs - rhs;
lhs = y(30);
rhs = params(32)*y(10)+params(41)*x(it_, 1);
residual(28) = lhs - rhs;
lhs = y(31);
rhs = params(33)*y(11)+y(22)-params(8)*y(2);
residual(29) = lhs - rhs;
lhs = y(22);
rhs = params(42)*x(it_, 6);
residual(30) = lhs - rhs;
lhs = y(32);
rhs = params(34)*y(12)+y(21)-params(7)*y(1);
residual(31) = lhs - rhs;
lhs = y(21);
rhs = params(43)*x(it_, 7);
residual(32) = lhs - rhs;
lhs = y(34);
rhs = y(14)*(1-T(5))+y(38)*T(5)+y(29)*params(11)*T(5)*T(9);
residual(33) = lhs - rhs;

end
