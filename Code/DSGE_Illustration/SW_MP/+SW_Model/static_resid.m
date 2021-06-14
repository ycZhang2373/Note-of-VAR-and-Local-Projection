function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = SW_Model.static_resid_tt(T, y, x, params);
end
residual = zeros(33, 1);
lhs = y(6);
rhs = params(9)*y(23)+(1-params(9))*y(27);
residual(1) = lhs - rhs;
lhs = y(22);
rhs = y(23)*T(7);
residual(2) = lhs - rhs;
lhs = y(23);
rhs = y(27)+y(26)-y(24);
residual(3) = lhs - rhs;
lhs = y(24);
rhs = y(22)+y(13);
residual(4) = lhs - rhs;
lhs = y(16);
rhs = y(9)+T(9)*(y(16)+y(16)*T(8)+y(25)*1/T(11));
residual(5) = lhs - rhs;
lhs = y(25);
rhs = y(7)*1/T(13)-y(28)+y(23)*(T(3)-(1-params(12)))/T(3)+y(25)*(1-params(12))/T(3);
residual(6) = lhs - rhs;
lhs = y(15);
rhs = y(7)+y(15)*T(12)/(1+T(12))+y(15)*1/(1+T(12))-T(13)*y(28);
residual(7) = lhs - rhs;
lhs = y(3);
rhs = y(8)+(1-params(36)-T(6))*y(15)+T(6)*y(16)+(T(3)-(1-params(12)))*T(5)*y(22);
residual(8) = lhs - rhs;
lhs = y(3);
rhs = params(15)*(y(6)+params(9)*y(24)+(1-params(9))*y(26));
residual(9) = lhs - rhs;
lhs = y(27);
rhs = y(26)*params(20)+y(15)*1/(1-T(12))-y(15)*T(12)/(1-T(12));
residual(10) = lhs - rhs;
lhs = y(13);
rhs = y(13)*(1-T(4))+T(4)*y(16)+y(9)*T(4)*T(11);
residual(11) = lhs - rhs;
lhs = y(29);
rhs = params(9)*y(31)+(1-params(9))*y(20)-y(6);
residual(12) = lhs - rhs;
lhs = y(30);
rhs = T(7)*y(31);
residual(13) = lhs - rhs;
lhs = y(31);
rhs = y(20)+y(21)-y(32);
residual(14) = lhs - rhs;
lhs = y(32);
rhs = y(30)+y(14);
residual(15) = lhs - rhs;
lhs = y(18);
rhs = y(9)+T(9)*(y(18)+T(8)*y(18)+1/T(11)*y(33));
residual(16) = lhs - rhs;
lhs = y(33);
rhs = y(7)*1/T(13)+y(19)-y(5)+(T(3)-(1-params(12)))/T(3)*y(31)+(1-params(12))/T(3)*y(33);
residual(17) = lhs - rhs;
lhs = y(17);
rhs = y(7)+T(12)/(1+T(12))*y(17)+1/(1+T(12))*y(17)-T(13)*(y(5)-y(19));
residual(18) = lhs - rhs;
lhs = y(4);
rhs = y(8)+(1-params(36)-T(6))*y(17)+T(6)*y(18)+(T(3)-(1-params(12)))*T(5)*y(30);
residual(19) = lhs - rhs;
lhs = y(4);
rhs = params(15)*(y(6)+params(9)*y(32)+(1-params(9))*y(21));
residual(20) = lhs - rhs;
lhs = y(19);
rhs = y(11)+1/(1+T(8)*params(18))*(y(19)*params(18)+T(8)*y(19)+y(29)*T(14));
residual(21) = lhs - rhs;
lhs = y(20);
rhs = y(12)+T(9)*y(20)+y(20)*T(15)+y(19)*params(16)/(1+T(8))-y(19)*(1+T(8)*params(16))/(1+T(8))+y(19)*T(15)+T(16)*(params(20)*y(21)+1/(1-T(12))*y(17)-T(12)/(1-T(12))*y(17)-y(20));
residual(22) = lhs - rhs;
lhs = y(5);
rhs = y(19)*params(22)*(1-params(25))+(1-params(25))*params(24)*(y(4)-y(3))+params(23)*(y(3)+y(4)-y(3)-y(4))+y(5)*params(25)+y(10);
residual(23) = lhs - rhs;
lhs = y(6);
rhs = y(6)*params(26)+params(37)*x(2);
residual(24) = lhs - rhs;
lhs = y(7);
rhs = y(7)*params(28)+params(38)*x(3);
residual(25) = lhs - rhs;
lhs = y(8);
rhs = y(8)*params(29)+params(39)*x(5)+x(2)*params(37)*params(2);
residual(26) = lhs - rhs;
lhs = y(9);
rhs = y(9)*params(31)+params(40)*x(4);
residual(27) = lhs - rhs;
lhs = y(10);
rhs = y(10)*params(32)+params(41)*x(1);
residual(28) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(33)+y(2)-y(2)*params(8);
residual(29) = lhs - rhs;
lhs = y(2);
rhs = params(42)*x(6);
residual(30) = lhs - rhs;
lhs = y(12);
rhs = y(12)*params(34)+y(1)-y(1)*params(7);
residual(31) = lhs - rhs;
lhs = y(1);
rhs = params(43)*x(7);
residual(32) = lhs - rhs;
lhs = y(14);
rhs = (1-T(4))*y(14)+T(4)*y(18)+y(9)*params(11)*T(4)*T(10);
residual(33) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
