function ABCD = ABCD_fun(model);
% prepare inputs

decision = model.decision;
n_s      = model.n_s;  % 20 state variable
n_eps    = model.n_eps;  % 7 structural shocks
obs      = model.obs;  % SW_model.obs = [34 4]

% ABCD representation in macro aggregates y

A = decision(1:n_s,1:n_s); A = A';
B = decision(n_s+1:n_s+n_eps,1:n_s); B = B';
C = decision(1:n_s,obs); C = C';
D = decision(n_s+1:n_s+n_eps,obs); D = D';

% collect results

ABCD.A = A;
ABCD.B = B;
ABCD.C = C;
ABCD.D = D;

end