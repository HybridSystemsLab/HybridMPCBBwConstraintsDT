function [LC] = flowcost(x1,x2,gamma,h)

     LC = gamma*(gamma*(x1-h)+x2^2/2)^2/(1+2*gamma*x1+x2^2);
     
end