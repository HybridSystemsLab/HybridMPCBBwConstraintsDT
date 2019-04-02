function [uf,u,J] = Solveminlp(Opt,v0)

% Solve the MINLP problem

[v,J,exitflag,info] = solve(Opt,v0)

% Inputs
uf=v(1:2:end);
u=v(2:2:end); 


end