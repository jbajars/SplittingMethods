function Pi = Comp_Matrix_Pi(parm,vars)

% Compute charge system matrix: Pi

% Compute charge energy En_tau
En_tau = Comp_Charge_En_tau(parm,vars);

% Displacement differences; 
% due to symmetry, we require only one vector 
up = vars.u(parm.idx_p) - vars.u;
rp = 1 + up;
J = -Comp_Charge_J_tau(parm,rp);

% Sparse matrix implementation
Pi = sparse(parm.EI,parm.EJ,[En_tau; J; J]);

end