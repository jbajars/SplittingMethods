function En_tau_deriv = Comp_Charge_En_tau_deriv(parm,vars)

% Compute derivative of charge energy En 
En_tau_deriv = vars.u*parm.Uc0_tau;
En_tau_deriv = parm.Q*En_tau_deriv;

end