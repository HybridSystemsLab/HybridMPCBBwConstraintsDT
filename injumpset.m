function v=injumpset(x1,x2,s,gamma)
if (x1==0&&x2<=0)||(x1<=0&& x1-s*x2-s^2*gamma/2>=0)
    
    v=1;
else
    v=0;
end


end
