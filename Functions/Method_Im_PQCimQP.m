function vars = Method_Im_PQCimQP(parm,vars,h)

% Semi-implicit symplectic splitting method PQCimQP
% Exact charge probability conservation

% Piece P with time step: h/2
vars = TimeInt_Split_P(parm,vars,h/2);

% Piece Q with time step: h/2
vars = TimeInt_Split_Q(parm,vars,h/2);

% Implicit midpoint piece C integration with time step: h 
vars = TimeInt_Split_Cim(parm,vars,h);

% Piece Q with time step: h/2
vars = TimeInt_Split_Q(parm,vars,h/2);

% Piece P with time step: h/2
vars = TimeInt_Split_P(parm,vars,h/2);

end