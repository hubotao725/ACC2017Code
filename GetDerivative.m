function [y,z,theta]=GetDerivative(b,N)
%GetDerivative this function get the derivative of the input
%y1 is the first trajectory for y
%y2 is the second trajectory for y
%z1 is the first trajectory for z
%z2 is the second trajectory for z
%b is the vector of input
%y is the time derivative of y
%z is the time derivative of z
addpath('G:\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
import casadi.*
y=SX(N,4);

z=SX(N,4);
theta=SX(N,2);
q=b(3*N+1:6*N);
p=b(6*N+1:8*N);
y(1:N,1)=b(1:N);
y(1:N,2)=b(N+1:2*N);
y(1:N,3)=b(5*N+1:6*N); 
z(1:N,1)=b(2*N+1:3*N);
z(1:N,2)=b(3*N+1:4*N);
z(1:N,3)=b(6*N+1:7*N); 


theta(1:N,1)=b(4*N+1:5*N);
theta(1:N,2)=b(7*N+1:8*N);
end