function dJ = Comp_Charge_J_tau_deriv(parm,r)

% Compute derivative of charge transfer function: dJ(r)
dJ = -parm.alpha*Comp_Charge_J_tau(parm,r);

end