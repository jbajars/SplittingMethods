function vars = TimeInt_ImMidpStep_ChargeEqs(parm,vars,h)

% Compute one-time step of charge equations
% with implicit midpoint method and step h
% in complex form

% Compute charge energy En_tau
En_tau = Comp_Charge_En_tau(parm,vars);

% Displacement differences; 
% due to symmetry, we require only one vector 
up = vars.u(parm.idx_p) - vars.u;
rp = 1 + up;
J = -Comp_Charge_J_tau(parm,rp);

% Sparse matrix implementation
z = vars.a + 1i*vars.b;
J = 1i*h/2*J;
M1 = sparse(parm.EI,parm.EJ,[ones(parm.N,1)-1i*h/2*En_tau; -J; -J]);
M2 = sparse(parm.EI,parm.EJ,[ones(parm.N,1)+1i*h/2*En_tau; J; J]);
z = M2\(M1*z);
vars.a = real(z);
vars.b = imag(z);

end