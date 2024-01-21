//setup
var infl unemp int z a;
varexo ex_a ex_z;
parameters rho rhoz rhoa phipi phiu pibar lambda xi;

set_param_value('rho',0.02);
set_param_value('phipi',1.5);
set_param_value('phiu',0.5);
set_param_value('pibar',0.02);
set_param_value('lambda',1);
set_param_value('xi',0.2);
set_param_value('rhoz',0.5);
set_param_value('rhoa',0.5);

///////////////////////////////////////

model;
// Euler Equation
z+unemp=-rho+int-infl(+1)+z(+1)+unemp(+1);

// merge PC(59) and wage infl. fct (58) 
infl-pibar=lambda*(infl(-1)-pibar)-xi*unemp;

// Shocks (eq 45 & 46)
a=rhoa*a(-1)-ex_a;
z=rhoz*z(-1)-ex_z;


// Taylor Rule (eq 60) MP
int=max(0, rho+pibar+phipi*(infl-pibar)-phiu*unemp);
end;

///////////////////////////////////////

steady_state_model;
a=0;
z=0;
unemp=0;
int=rho+pibar;
infl=pibar;
end;
steady;
check;

///////////////////////////////////////

initval;
unemp=0;
infl=pibar;
a=0;
z=0;
end;

endval;
unemp=0;
infl=pibar;
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
