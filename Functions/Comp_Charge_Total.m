function C2 = Comp_Charge_Total(parm,vars)

% Compute total charge probability
C2_density = Comp_Charge_Density(parm,vars);
C2 = sum(C2_density);

end