function vars = TimeInt_Split_A(parm,vars,h)

% Exact integration of piece A with time step h

% Compute particle position dependent system matrix L
L = Comp_Matrix_L(parm,vars);

% Update a with time step h
vars.a = vars.a + h*(L*vars.b);

% Compute charge-lattice force G_A
G_A = Comp_ChargeLattice_GA_Force(parm,vars);

% Update p with time step h
vars.p = vars.p + h*G_A;

end