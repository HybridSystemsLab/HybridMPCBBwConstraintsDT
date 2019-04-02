function y=jumpmap(x,u,s,gamma,lambda)

    y=[0;u-lambda*(x(2)+x(1)/s*(1-(x(2)/(x(2)+s*gamma))))];
end