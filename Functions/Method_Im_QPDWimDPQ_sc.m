function vars = Method_Im_QPDWimDPQ_sc(parm,vars,h)

% Semi-implicit symplectic splitting method QPDWimDPQ_sc
% Exact charge probability conservation

% Piece Q with time step: h/2
vars = TimeInt_Split_Q(parm,vars,h/2);

% Piece P with time step: h/2
vars = TimeInt_Split_P(parm,vars,h/2);

% Piece D with time step: h/2
vars = TimeInt_Split_D(parm,vars,h/2);

% Rescaling a and b values
C2 = sum(vars.a.^2 + vars.b.^2);
vars.a = vars.a/sqrt(C2)*parm.tau_f;
vars.b = vars.b/sqrt(C2)*parm.tau_f;

% Implicit midpoint piece W integration with time step: h 
vars = TimeInt_Split_Wim(parm,vars,h);

% Piece D with time step: h/2
vars = TimeInt_Split_D(parm,vars,h/2);

% Rescaling a and b values
C2 = sum(vars.a.^2 + vars.b.^2);
vars.a = vars.a/sqrt(C2)*parm.tau_f;
vars.b = vars.b/sqrt(C2)*parm.tau_f;

% Piece P with time step: h/2
vars = TimeInt_Split_P(parm,vars,h/2);

% Piece Q with time step: h/2
vars = TimeInt_Split_Q(parm,vars,h/2);

end