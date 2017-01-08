%this file will generate the true result

syms t1 t2 real;
res=solve(10*(t1-t2)-5,5*t1^2+10*t1*t2-5*t2^2-5*(t1+t2)-10);
disp(vpa(res.t1+res.t2,9));