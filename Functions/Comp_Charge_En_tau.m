function En_tau = Comp_Charge_En_tau(parm,vars)

% Compute charge energy En 
En_tau = -1/2*vars.u.^2*parm.Uc0_tau;
En_tau = parm.Q*(parm.E0_tau + En_tau);

end