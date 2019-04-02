function [x,ufnew] = trajectory(x0,u,uf,gamma,lambda,s)

N = length(uf)+1;
n = length(x0);

x = zeros(n,N);
x(:,1) = x0;

for idx = 1:N-1
  
    
    if uf(idx)*inflowset(x(1,idx))+(1-uf(idx))*injumpset(x(1,idx),x(2,idx),s,gamma)<=0
        uf(idx) = (1- uf(idx));       
    end
       
    x(:,idx+1) = uf(idx)*inflowset(x(1,idx))*flowmap(x(:,idx),s,gamma) +(1-uf(idx))*injumpset(x(1,idx),x(2,idx),s,gamma)*jumpmap(x(:,idx),u(idx),s,gamma,lambda);
end

ufnew = uf;

end