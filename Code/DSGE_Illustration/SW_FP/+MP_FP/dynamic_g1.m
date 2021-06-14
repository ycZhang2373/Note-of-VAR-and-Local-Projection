function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = MP_FP.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(19, 30);
g1(1,10)=1;
g1(1,11)=params(5);
g1(1,26)=(-params(5));
g1(2,11)=1;
g1(2,19)=(-T(1));
g1(3,7)=1;
g1(3,8)=1;
g1(3,11)=(-1);
g1(3,12)=(-1);
g1(4,6)=1;
g1(4,25)=(-params(2));
g1(4,12)=(-T(3));
g1(4,18)=(-1);
g1(5,25)=T(2);
g1(5,10)=T(2);
g1(5,12)=1;
g1(5,27)=(-1);
g1(5,15)=(-T(2));
g1(6,13)=1;
g1(6,19)=params(5)*T(1);
g1(6,28)=(-(params(5)*T(1)));
g1(7,25)=1;
g1(7,14)=1;
g1(7,15)=(-1);
g1(8,8)=1;
g1(8,19)=(-params(6));
g1(9,7)=1;
g1(9,8)=1;
g1(9,9)=(-1);
g1(10,3)=(-params(4));
g1(10,18)=1;
g1(10,30)=(-1);
g1(11,4)=(-params(3));
g1(11,19)=1;
g1(11,29)=(-1);
g1(12,9)=1;
g1(12,16)=(-(1-params(1)));
g1(12,19)=(-1);
g1(13,6)=(-4);
g1(13,1)=4;
g1(13,9)=(-4);
g1(13,2)=(-(4*params(8)));
g1(13,15)=(-(4*(-params(8))));
g1(13,17)=1;
g1(14,15)=(-4);
g1(14,21)=1;
g1(15,14)=(-4);
g1(15,20)=1;
g1(16,13)=(-4);
g1(16,22)=1;
g1(17,6)=(-4);
g1(17,23)=1;
g1(18,6)=1;
g1(18,5)=1;
g1(18,24)=(-1);
g1(19,6)=(-T(4));
g1(19,10)=(-1);
g1(19,15)=1;

end
