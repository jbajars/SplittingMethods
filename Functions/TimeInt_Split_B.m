function vars = TimeInt_Split_B(parm,vars,h)

% Exact integration of piece B with time step h

% Compute particle position dependent system matrix L
L = Comp_Matrix_L(parm,vars);

% Update b with time step h
vars.b = vars.b - h*(L*vars.a);

% Compute charge-lattice force G_B
G_B = Comp_ChargeLattice_GB_Force(parm,vars);

% Update p with time step h
vars.p = vars.p + h*G_B;

end