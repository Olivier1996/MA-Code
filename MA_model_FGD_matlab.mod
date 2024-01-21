//setup
var infl_FGD unemp_FGD alpha int_FGD a z_FGD;
varexo ex_a ex_z;

parameters rho rhoz rhoa pibar lambda xi beta kappa;


set_param_value('rho',0.02);
set_param_value('pibar',0.02);
set_param_value('lambda',1);
set_param_value('xi',0.2);
set_param_value('rhoz',0.5);
set_param_value('rhoa',0.5);
set_param_value('beta',0.98);
set_param_value('kappa',10);


///////////////////////////////////////

model;
// Phillips curve & wage infl.
infl_FGD-pibar=lambda*(infl_FGD(-1)-pibar)-xi*unemp_FGD;

// Euler equation
z_FGD+unemp_FGD=-rho+int_FGD-infl_FGD(+1)+z_FGD(+1)+unemp_FGD(+1);

// Monetary policy
0 = kappa*(infl_FGD-pibar) + lambda*beta*(exp(z_FGD(+1))*(1-exp(-unemp_FGD(+1)))-alpha(+1)+alpha/beta)/xi - (exp(z_FGD)*(1-exp(-unemp_FGD))-alpha+alpha(-1)/beta)/xi - alpha(-1);
[mcp = 'int_FGD>0']
alpha=0;

// Shocks
a=rhoa*a(-1)-ex_a;
z_FGD=rhoz*z_FGD(-1)-ex_z;
end;

///////////////////////////////////////

steady_state_model;
a=0;
z_FGD=0;
unemp_FGD=0;
int_FGD=rho+pibar;
infl_FGD=pibar;
alpha=0;
end;
steady;
check;

///////////////////////////////////////

initval;
unemp_FGD=0;
infl_FGD=pibar;
a=0;
z_FGD=0;
end;

endval;
unemp_FGD=0;
infl_FGD=pibar;
end;

///////////////////////////////////////

shocks;
var ex_z;
periods 1;
values 0.15;
var ex_a;
periods 1;
values 0;
end;

///////////////////////////////////////

perfect_foresight_setup(periods=20);
perfect_foresight_solver(lmmcp);