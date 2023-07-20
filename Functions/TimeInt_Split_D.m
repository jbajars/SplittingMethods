function vars = TimeInt_Split_D(parm,vars,h)

% Exact integration of piece D with time step h

% Compute charge-lattice force G_D
G_D = Comp_ChargeLattice_GD_Force(parm,vars);

% Update p with time step h
vars.p = vars.p + h*G_D;

% Compute charge energy En_tau
En_tau = Comp_Charge_En_tau(parm,vars);

% Exponent of En_tau
Exp_En_tau = exp(-En_tau*h*1i); 

% Exact integration 
z = vars.a + 1i*vars.b;
z = Exp_En_tau.*z;
vars.a = real(z); 
vars.b = imag(z);

end