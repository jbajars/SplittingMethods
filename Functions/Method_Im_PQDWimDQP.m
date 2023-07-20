function vars = Method_Im_PQDWimDQP(parm,vars,h)

% Semi-implicit symplectic splitting method PQDWimDQP
% Exact charge probability conservation

% Piece P with time step: h/2
vars = TimeInt_Split_P(parm,vars,h/2);

% Piece Q with time step: h/2
vars = TimeInt_Split_Q(parm,vars,h/2);

% Piece D with time step: h/2
vars = TimeInt_Split_D(parm,vars,h/2);

% Implicit midpoint piece W integration with time step: h 
vars = TimeInt_Split_Wim(parm,vars,h);

% Piece D with time step: h/2
vars = TimeInt_Split_D(parm,vars,h/2);

% Piece Q with time step: h/2
vars = TimeInt_Split_Q(parm,vars,h/2);

% Piece P with time step: h/2
vars = TimeInt_Split_P(parm,vars,h/2);

end