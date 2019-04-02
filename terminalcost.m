function V = terminalcost(x1,x2,gamma,h)

    V = (3+atan(x2))*(gamma*(x1-h)+x2^2/2)^2;

end