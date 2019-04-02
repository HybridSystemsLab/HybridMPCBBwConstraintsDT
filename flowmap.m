function y=flowmap(x,s,gamma)

    y=x+[s*x(2)-gamma*s^2/2; -s*gamma];
end