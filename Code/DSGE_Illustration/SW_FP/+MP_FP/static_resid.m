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
    T = MP_FP.static_resid_tt(T, y, x, params);
end
residual = zeros(19, 1);
residual(1) = y(5);
lhs = y(6);
rhs = (1+params(6))/(params(1)+params(6)+(1-params(1))*params(5))*y(14);
residual(2) = lhs - rhs;
lhs = y(2);
rhs = y(7)+y(6)-y(3);
residual(3) = lhs - rhs;
lhs = y(1);
rhs = y(13)+params(2)*y(1)+T(1)*y(7);
residual(4) = lhs - rhs;
lhs = y(7);
rhs = y(7)+T(3)*(y(10)-y(1)-y(5));
residual(5) = lhs - rhs;
residual(6) = y(8);
lhs = y(9);
rhs = y(10)-y(1);
residual(7) = lhs - rhs;
lhs = y(3);
rhs = params(6)*y(14);
residual(8) = lhs - rhs;
lhs = y(2);
rhs = y(4)-y(3);
residual(9) = lhs - rhs;
lhs = y(13);
rhs = params(4)*y(13)+x(2);
residual(10) = lhs - rhs;
lhs = y(14);
rhs = y(14)*params(3)+x(1);
residual(11) = lhs - rhs;
lhs = y(4);
rhs = y(14)+(1-params(1))*y(11);
residual(12) = lhs - rhs;
lhs = y(12);
rhs = y(1)*4;
residual(13) = lhs - rhs;
lhs = y(16);
rhs = y(10)*4;
residual(14) = lhs - rhs;
lhs = y(15);
rhs = y(9)*4;
residual(15) = lhs - rhs;
lhs = y(17);
rhs = y(8)*4;
residual(16) = lhs - rhs;
lhs = y(18);
rhs = y(1)*4;
residual(17) = lhs - rhs;
residual(18) = y(1);
lhs = y(10);
rhs = y(5)+T(2)*y(1);
residual(19) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
