%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Charge transfer by discrete breathers in 1D model
% written by Janis Bajars, April 2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clearvars
clc
set(0,'DefaultAxesFontSize',16)
set(groot,'DefaultAxesTickLabelInterpreter','latex'); 
set(groot,'DefaultTextInterpreter','latex');
set(groot,'DefaultLegendInterpreter','latex');

disp('Start of the computation!')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add path
addpath('Functions')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute parameter values in structure <parm> 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Parameter_Values;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define simulation variables (u,a,p,b) in structure <vars>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Define_Variables;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set initial conditions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % % % Initial conditions: stationary breather + charge
% % % L = round(parm.N/2);
% % % % Lattice
% % % gamma = 0.4;
% % % vars.p(L-1) = -1*gamma;
% % % vars.p(L) = 2*gamma;
% % % vars.p(L+1) = -2*gamma;
% % % vars.p(L+2) = 1*gamma;
% % % % Charge
% % % vars.a(L) = 1;
% % % vars.b(L) = -1;

% Initial conditions: moving breather + charge
L = round(parm.N/4);
% Lattice
gamma = 0.6;
vars.p(L-1) = -1*gamma;
vars.p(L) = 2*gamma;
vars.p(L+1) = -1*gamma;
% Charge
vars.a(L) = 1;
vars.b(L) = -1;

% Make sure that charge constraint is satisfied
C2 = sum(vars.a.^2 + vars.b.^2);
vars.a = vars.a/sqrt(C2)*parm.tau_f;
vars.b = vars.b/sqrt(C2)*parm.tau_f;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matrices for saving data in time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
U = zeros(parm.N,parm.Nsteps+1); 
U(:,1) = vars.u;
Q = zeros(parm.N,parm.Nsteps+1); 
Q(:,1) = parm.x + vars.u;
P = zeros(parm.N,parm.Nsteps+1); 
P(:,1) = vars.p;
A = zeros(parm.N,parm.Nsteps+1); 
A(:,1) = vars.a;
B = zeros(parm.N,parm.Nsteps+1); 
B(:,1) = vars.b;
H = zeros(parm.Nsteps+1,1); 
H(1,1) = Comp_Hamiltonian(parm,vars);
C2 = zeros(parm.Nsteps+1,1); 
C2(1,1) = Comp_Charge_Total(parm,vars);
C2_density = zeros(parm.N,parm.Nsteps+1); 
C2_density(:,1) = Comp_Charge_Density(parm,vars);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time integration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
for n=1:parm.Nsteps
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Explicit Runge-Kutta 4 method
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
% % %     vars = Method_RK4(parm,vars,parm.h);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Semi-implicit splitting methods
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
% % %     vars = Method_Im_PQCimQP(parm,vars,parm.h);  
% % %     vars = Method_Im_QPCimPQ(parm,vars,parm.h);  
% % %     
% % %     vars = Method_Im_PQDWimDQP(parm,vars,parm.h); 
% % %     vars = Method_Im_QPDWimDPQ(parm,vars,parm.h); 
% % %     
% % %     vars = Method_Im_PQDWimDQP_sc(parm,vars,parm.h); 
% % %     vars = Method_Im_QPDWimDPQ_sc(parm,vars,parm.h);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Explicit splitting methods
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % %     vars = Method_Ex_PQABDBAQP(parm,vars,parm.h);
% % %     vars = Method_Ex_PQBADABQP(parm,vars,parm.h);
% % %     
    vars = Method_Ex_PQDABADQP(parm,vars,parm.h);
% % %     vars = Method_Ex_PQDBABDQP(parm,vars,parm.h); 
% % % 
% % %     vars = Method_Ex_DABQPQBAD(parm,vars,parm.h);
% % %     vars = Method_Ex_DBAQPQABD(parm,vars,parm.h);
% % % 
% % %     vars = Method_Ex_ABDQPQDBA(parm,vars,parm.h);    
% % %     vars = Method_Ex_BADQPQDAB(parm,vars,parm.h);  
    
    % Save data in time
    U(:,n+1) = vars.u;
    Q(:,n+1) = parm.x + vars.u*1.5;
    P(:,n+1) = vars.p;
    A(:,n+1) = vars.a;
    B(:,n+1) = vars.b;
    H(n+1,1) = Comp_Hamiltonian(parm,vars);
    C2(n+1,1) = Comp_Charge_Total(parm,vars);
    C2_density(:,n+1) = Comp_Charge_Density(parm,vars);
    
end

% % % % Save data: optional
% % % save('SavedData/charge_transfer_simulation.mat','parm','vars',...
% % %     'U','Q','P','A','B','H','C2','C2_density')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot results and errors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
set(gcf, 'Position',  [100, 550, 700, 400])
colormap(flipud(hot))
contourf(parm.t,parm.x,C2_density,'edgecolor','none')
shading flat
caxis([0 1])
c=colorbar;
set(c,'TickLabelInterpreter','latex')
hold on
plot(parm.t,Q','-k','linewidth',1)
axis on
box on
xlabel('$t$')
ylabel('$q_n^0+1.5u_n$','interpreter','latex')
axis([0 parm.Tend 0 parm.N-1])
legend('Charge probability $P_n$')
set(legend,'location','northwest')

% % % % Save figure: optional
% % % exportgraphics(gcf,'Figures/mov_solution.png','Resolution',300)

figure(2)
set(gcf, 'Position',  [900, 550, 700, 400])
ErrorH = abs((H-H(1))/H(1));
plot(parm.t,ErrorH,'-r','linewidth',1.5)
axis on
box on
grid on
xlabel('$t$')
ylabel('Relative Hamiltonian error')

figure(3)
set(gcf, 'Position',  [500, 50, 700, 400])
ErrorC = abs((C2-C2(1))/C2(1));
plot(parm.t,ErrorC,'-b','linewidth',1.5)
axis on
box on
grid on
xlabel('$t$')
ylabel('Relative probability error')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Remove path
rmpath('Functions')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
