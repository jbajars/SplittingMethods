function vars = TimeInt_Split_Cim(parm,vars,h)

% Implicit midpoint integration of piece C with time step h
a = vars.a;
b = vars.b;

% Compute new a and b values
vars = TimeInt_ImMidpStep_ChargeEqs(parm,vars,h);
A = vars.a;
B = vars.b;

% Compute charge-lattice force G
vars.a = (A+a)/2;
vars.b = (B+b)/2;
G = Comp_ChargeLattice_G_Force(parm,vars);

% Update p with time step h
vars.p = vars.p + h*G;

% New a and b values
vars.a = A;
vars.b = B;

end