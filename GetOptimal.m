function [x_opt,f_opt,tstop]=GetOptimal(N,finalPos)
%GetOptimal this function gets the optimal result
%N is the length
%final pos is the final position
%x_opt is the optimal variables
%f_opt is the optimal time
addpath('G:\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
addpath('C:\Users\hubot\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
import casadi.*
 
b=SX.sym('b',8*N+1,1);
s=SX.sym('s',N,1);
maxS=1;


[f]=CostFun(b,N);

[y,z,theta]=GetDerivative(b,N);

g=ConstrFun(y,z,theta,b,N,finalPos);

nlp=SXFunction('nlp',nlpIn('x',b),nlpOut('f',f,'g',g));
solver=NlpSolver('solver','ipopt',nlp);

arg=struct;
arg=InitArg(arg,N);
tstart=tic();
res=solver(arg);
tstop=toc(tstart);
disp(tstop);
f_opt=full(res.f);
x_opt=full(res.x);
end