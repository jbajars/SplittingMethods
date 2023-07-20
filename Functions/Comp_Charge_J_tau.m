function J = Comp_Charge_J_tau(parm,r)

% Compute charge transfer function: J(r)
J = parm.J0_tau*exp(-parm.alpha*r);

end