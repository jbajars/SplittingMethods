function L = Comp_Matrix_L(parm,vars)

% Compute charge system matrix without En_tau: L

% Displacement differences; 
% due to symmetry, we require only one vector 
up = vars.u(parm.idx_p) - vars.u;
rp = 1 + up;
J = -Comp_Charge_J_tau(parm,rp);

% Sparse matric implementation
L = sparse(parm.EI,parm.EJ,[zeros(parm.N,1); J; J]);

end