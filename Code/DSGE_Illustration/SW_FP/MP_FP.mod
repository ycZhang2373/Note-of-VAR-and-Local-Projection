% addpath D:\Matlab\bin\dynare-4.6.4\matlab
% var：内生变量声明(19个)
var 
    pi ${\pi}$ (long_name='inflation')
    y_gap ${tilde y}$ (long_name='output gap')
    y_nat ${y^{nat}}$ (long_name='natural output')
    y ${y}$ (long_name='output')
    r_e  ${r^{e}}$ (long_name='efficient interest rate')
    y_e  ${y^{nat}}$ (long_name='efficient output') 
    x ${x}$ (long_name='welfare-relevant output gap')
    r_nat ${r^{nat}}$ (long_name='natural interest rate')
    r_real ${r^r}$ (long_name='real interest rate')     
    i ${i}$ (long_name='nominal interest rate')
    n ${n}$ (long_name='hours worked')
    m_growth_ann ${\Delta m}$ (long_name='money growth')
    u ${u}$ (long_name='AR(1) cost push shock process')
    a  ${a}$ (long_name='AR(1) technology shock process')
    r_real_ann ${r^{r,ann}}$ (long_name='annualized real interest rate')
    i_ann ${i^{ann}}$ (long_name='annualized nominal interest rate')
    r_nat_ann ${r^{nat,ann}}$ (long_name='annualized natural interest rate')
    pi_ann ${\pi^{ann}}$ (long_name='annualized inflation rate')
    p ${p}$ (long_name='price level')
    ;     
% varexo：外生变量声明（2个）
varexo 
    eps_a ${\varepsilon_a}$   (long_name='technology shock')
    eps_u ${\varepsilon_u}$   (long_name='monetary policy shock');

parameters 
    alppha ${\alppha}$ (long_name='capital share')
    betta ${\beta}$ (long_name='discount factor')
    rho_a ${\rho_a}$ (long_name='autocorrelation technology shock')
    rho_u ${\rho_{u}}$ (long_name='autocorrelation cost push shock')
    siggma ${\sigma}$ (long_name='log utility')
    phi ${\phi}$ (long_name='unitary Frisch elasticity')
    phi_y ${\phi_{y}}$ (long_name='output feedback Taylor Rule')
    eta ${\eta}$ (long_name='semi-elasticity of money demand')
    epsilon ${\epsilon}$ (long_name='demand elasticity')
    theta ${\theta}$ (long_name='Calvo parameter')
    ;
%----------------------------------------------------------------
% Parametrization, p. 52
%----------------------------------------------------------------
siggma = 1;
phi=1;
phi_y  = .5/4;
theta=2/3;
rho_u = 0;
rho_a  = 0.9;
betta = 0.99;
eta  =4;
alppha=1/3;
epsilon=6;

%----------------------------------------------------------------
% First Order Conditions
%----------------------------------------------------------------

model(linear); 
% Define model-local variables to improve readability
% Composite parameters
#Omega=(1-alppha)/(1-alppha+alppha*epsilon);  //defined on page 47
#psi_n_ya=(1+phi)/(siggma*(1-alppha)+phi+alppha); //defined on page 48
#lambda=(1-theta)*(1-betta*theta)/theta*Omega; //defined on page 47
#kappa=lambda*(siggma+(phi+alppha)/(1-alppha));  //defined on page 49
#alpha_x=kappa/epsilon; //defined on page 96
#phi_pi=(1-rho_u)*kappa*siggma/(alpha_x)+rho_u; //defined on page 101

% 在这里输入模型的均衡条件
//1. Definition efficient interest rate, below equation (4)
r_e=siggma*(y_e(+1)-y_e);

//2. Definition efficient output
y_e=psi_n_ya*a;

//3. Definition linking various output gaps, bottom page 96
y_gap=x+(y_e-y_nat);

//4. New Keynesian Phillips Curve eq. (2)
pi=betta*pi(+1)+kappa*x + u;

//5. Dynamic IS Curve eq. (4)
x=-1/siggma*(i-pi(+1)-r_e)+x(+1);

//6. Definition natural rate of interest eq. (23)
r_nat=siggma*psi_n_ya*(a(+1)-a);

//7. Definition real interest rate
r_real=i-pi(+1);

//8. Natural output
y_nat=phi*a;

//9. Definition output gap
y_gap=y-y_nat;

//10. cost push shock, equation (3)
u=rho_u*u(-1)+eps_u;

//11. TFP shock
a=rho_a*a(-1)+eps_a;

//12. Production function (eq. 13)
y=a+(1-alppha)*n;

//13. Money growth (derived from eq. (4))
m_growth_ann=4*(y-y(-1)-eta*(i-i(-1))+pi);

//14. Annualized nominal interest rate
i_ann=4*i;

//15. Annualized real interest rate
r_real_ann=4*r_real;

//16. Annualized natural interest rate
r_nat_ann=4*r_nat;

//17. Annualized inflation
pi_ann=4*pi;

//18. Definition price level
pi=p-p(-1);

//19. Interest Rate Rule that implements optimal solution, eq. (10)
i=r_e+phi_pi*pi;
end;

%----------------------------------------------------------------
%  外生冲击设定，直接设定外生冲击的方差
%---------------------------------------------------------------

shocks;
var eps_u = 1;
end;

% Simul：确定性模拟；Stoch_simul：随机模拟；Estimation：估计
% periods表示随机模拟的期数
% irf用来指定脉冲响应函数的计算期数
% order表示求解的期数，即指定一阶、二阶或三阶的阶数
stoch_simul(order=1,periods=200,irf=0);
dynasave('simudata.mat');


