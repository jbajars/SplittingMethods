function [fu,fp,fa,fb,vars] = TimeInt_RK4_Stage(parm,vars,h,u,p,a,b,c)

% Compute one stage forces fu, fp, fa and fb of RK4
U = vars.u;
P = vars.p;
A = vars.a;
B = vars.b;
vars.u = U + c*h*u;
vars.p = P + c*h*p;
vars.a = A + c*h*a;
vars.b = B + c*h*b;

% Compute forces acting on lattice particles
G = Comp_Lattice_OnsiteForce(parm,vars);
F = Comp_Lattice_InteractionForce(parm,vars);
Z = Comp_ChargeLattice_G_Force(parm,vars);

% Compute particle position dependent system matrix Pi
Pi = Comp_Matrix_Pi(parm,vars);

% Compute fu
fu = vars.p;

% Compute fp
fp = F + G + Z;

% Compute fa
fa = Pi*vars.b;

% Compute fb
fb = -Pi*vars.a;

% Return original values of u, p, a and b
vars.u = U;
vars.p = P;
vars.a = A;
vars.b = B;

end