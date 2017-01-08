function [resY,resZ,resTheta]=GetQuadState(y,z,theta,x,x_opt)
%GetQuadState this function get the state of the quadrotor
%y is the symbol definition of the y motion
%z is the symbol definition of the z motion
%theta is the symbol definition of the angle
%x is the symbol input
%x_opt is the optimal input 
%resY is the value of the y motion
%resZ is the value of the z motion
%resTheta is the value of the angle motion
addpath('G:\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
import casadi.*

resY=GetResult(y,x,x_opt);
resZ=GetResult(z,x,x_opt);
resTheta=GetResult(theta,x,x_opt);
 


end