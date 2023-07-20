function vars = Method_RK4(parm,vars,h)

% Explicit non-symplectic Runge-Kutta 4 method

% Stage 1
u = zeros(size(vars.u));
p = zeros(size(vars.p));
a = zeros(size(vars.a));
b = zeros(size(vars.b));
c = 0;
[fu1,fp1,fa1,fb1,vars] = TimeInt_RK4_Stage(parm,vars,h,u,p,a,b,c);

% Stage 2
c = 1/2;
[fu2,fp2,fa2,fb2,vars] = TimeInt_RK4_Stage(parm,vars,h,fu1,fp1,fa1,fb1,c);

% Stage 3
c = 1/2;
[fu3,fp3,fa3,fb3,vars] = TimeInt_RK4_Stage(parm,vars,h,fu2,fp2,fa2,fb2,c);

% Stage 4
c = 1;
[fu4,fp4,fa4,fb4,vars] = TimeInt_RK4_Stage(parm,vars,h,fu3,fp3,fa3,fb3,c);

% Update u, p, a and b
vars.u = vars.u + h/6*(fu1+2*fu2+2*fu3+fu4);
vars.p = vars.p + h/6*(fp1+2*fp2+2*fp3+fp4);
vars.a = vars.a + h/6*(fa1+2*fa2+2*fa3+fa4);
vars.b = vars.b + h/6*(fb1+2*fb2+2*fb3+fb4);

end