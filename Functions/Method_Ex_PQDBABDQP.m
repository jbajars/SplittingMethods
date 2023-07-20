function vars = Method_Ex_PQDBABDQP(parm,vars,h)

% Explicit symplectic splitting method PQDBABDQP
% Approximate charge conservation

% Piece P with time step: h/2
vars = TimeInt_Split_P(parm,vars,h/2);

% Piece Q with time step: h/2
vars = TimeInt_Split_Q(parm,vars,h/2);

% Piece D with time step: h/2
vars = TimeInt_Split_D(parm,vars,h/2);

% Piece B with time step: h/2
vars = TimeInt_Split_B(parm,vars,h/2);

% Piece A with time step: h
vars = TimeInt_Split_A(parm,vars,h);

% Piece B with time step: h/2
vars = TimeInt_Split_B(parm,vars,h/2);

% Piece D with time step: h/2
vars = TimeInt_Split_D(parm,vars,h/2);

% Piece Q with time step: h/2
vars = TimeInt_Split_Q(parm,vars,h/2);

% Piece P with time step: h/2
vars = TimeInt_Split_P(parm,vars,h/2);

end