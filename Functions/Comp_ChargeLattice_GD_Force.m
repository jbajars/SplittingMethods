function G_D = Comp_ChargeLattice_GD_Force(parm,vars)

% Compute the charge-lattice diagonal force: F = -dHc_du
En_tau_deriv = Comp_Charge_En_tau_deriv(parm,vars);
G_D = (En_tau_deriv/2).*(vars.a.^2 + vars.b.^2);

end