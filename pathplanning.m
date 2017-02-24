%Path following solver
clear all;
close all;
addpath('G:\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
addpath('C:\Users\hubot\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
import casadi.*

N=201;
b=SX.sym('b',8*N+1,1);
s=SX.sym('s',N,1);
maxS=1;

finalPos=[15 0];%this is the final position
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
lam_x_opt=full(res.lam_x);
lam_g_opt=full(res.lam_g);
%[F_T,F_W]=GetInput(x_opt,N);
 [pltY,pltZ,pltTheta]=GetQuadState(y,z,theta,b,x_opt);
 h=figure(1);
 
LineWidth=1.5;
IMG_WIDTH=9;
IMG_HEIGHT=5;
FontSize=7;
step=1;
Ts=f_opt/(N-1);
F_t=full(res.g(5*N-4:6*N-5));
plot(Ts*(1:step:N),F_t(1:N));
xlabel('Time (s)');
ylabel('Control input (N/kg)');
title('Control input u_1 with respect to time');
set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);
xlim([0 5]);
ylim([0 5]);
set(gca,'FontSize',FontSize);
print -dpdf maneuver.pdf
h=figure(3); 

LineWidth=1.5;
IMG_WIDTH=9;
IMG_HEIGHT=5;
FontSize=7;
step=1;
Ts=f_opt/(N-1);
F_t=full(res.g(5*N-4:6*N-5));
set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);
plot(Ts*(1:step:N),F_t(1:N),'r','LineWidth',LineWidth); 
xlabel('Time (s)');
ylabel('Control input (N/kg)');
title('Control input u_1 with respect to time');
legend('u_1','u_2');
xlim([0 (N-1)*Ts]);
ylim([-10 21]);
set(gca,'FontSize',FontSize);
print -dpdf thrustinput.pdf
figure(4);
plot(pltY(1:N,1),pltZ(1:N,1));
title('thrust  time optimal');
figure(5);
plot(1:N,pltTheta(1:N));
h=figure(6);
PlotResult2(pltY,pltZ,pltTheta,N,h);
h2=figure(7);
PlotResult3(pltY,pltZ,pltTheta,N,h2,f_opt/(N-1));
