function [xpred] =prediction(N,s,gamma,lambda,h,x0,alpha)
%% initial variables
%% Initial Guess
v0 = zeros(2*N,1);  % All the initial variables for uf and u and x 
[~,ufnew] = trajectory(x0,zeros(N,1),zeros(N,1),gamma,lambda,s);
v0(1:2:end) = ufnew;

% Check the cost to see if alpha is reasonable
% J0 = costfunctional(x0,v0,gamma,lambda,h,s,alpha); 

%% Objective function

fun=@(v)costfunctional(x0,v,gamma,lambda,h,s,alpha);

% Linear Constraints
% A = [];
% b = [];

% Bounds
lb = [];
ub = [];

xtype=[];
for idx = 1:N
    xtype=[xtype,'BC']; % binary and continuous variables
end

%%
%Specify solver
opts = optiset('solver','nomad','display','iter','maxtime',1000,'maxiter',1e8);
% opts= optiset('solver','nomad','display','iter','maxtime',100,'solverOpts',bopts,'maxiter',1000)

% Create OPTI Object
Opt = opti('fun',fun,'bounds',lb,ub,'xtype',xtype,'options',opts);

%Solve the minimization with minlp       
[uf,u,J] = Solveminlp(Opt,v0);

[x,ufnew] = trajectory(x0,u,uf,gamma,lambda,s);

xpred=x
end 