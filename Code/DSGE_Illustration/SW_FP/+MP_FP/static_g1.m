function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = MP_FP.static_g1_tt(T, y, x, params);
end
g1 = zeros(19, 19);
g1(1,5)=1;
g1(2,6)=1;
g1(2,14)=(-((1+params(6))/(params(1)+params(6)+(1-params(1))*params(5))));
g1(3,2)=1;
g1(3,3)=1;
g1(3,6)=(-1);
g1(3,7)=(-1);
g1(4,1)=1-params(2);
g1(4,7)=(-T(1));
g1(4,13)=(-1);
g1(5,1)=T(3);
g1(5,5)=T(3);
g1(5,10)=(-T(3));
g1(6,8)=1;
g1(7,1)=1;
g1(7,9)=1;
g1(7,10)=(-1);
g1(8,3)=1;
g1(8,14)=(-params(6));
g1(9,2)=1;
g1(9,3)=1;
g1(9,4)=(-1);
g1(10,13)=1-params(4);
g1(11,14)=1-params(3);
g1(12,4)=1;
g1(12,11)=(-(1-params(1)));
g1(12,14)=(-1);
g1(13,1)=(-4);
g1(13,12)=1;
g1(14,10)=(-4);
g1(14,16)=1;
g1(15,9)=(-4);
g1(15,15)=1;
g1(16,8)=(-4);
g1(16,17)=1;
g1(17,1)=(-4);
g1(17,18)=1;
g1(18,1)=1;
g1(19,1)=(-T(2));
g1(19,5)=(-1);
g1(19,10)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
