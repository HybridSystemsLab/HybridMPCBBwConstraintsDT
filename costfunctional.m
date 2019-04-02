function J = costfunctional(x0,v,gamma,lambda,h,s,alpha)

uf=v(1:2:end);
u=v(2:2:end);

N=length(uf)+1;

[x,ufnew] = trajectory(x0,u,uf,gamma,lambda,s);

J = 0;
for idx = 1:N-1
    
  J = J+alpha*(ufnew(idx)*flowcost(x(1,idx),x(2,idx),gamma,h)+(1-ufnew(idx))*jumpcost(x(2,idx),gamma,h));
    
end

J = J+alpha*terminalcost(x(1,N),x(2,N),gamma,h);

end