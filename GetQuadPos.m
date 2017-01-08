function [y,z]=GetQuadPos(y1,y2,z1,z2,b,x_opt,N)
%GetQuadPos this function get the vector the quadrotor position
%x_opt is the optimal solution
%N is the length of the vector
%y is the y position
%z is the z position
%theta is the angle

s=linspace(0,1,N)';
y1=5*(s.^5-5*s.^4+5*s.^3);
y2=5*(s.^5-5*s.^4+5*s.^3);
q1=x_opt(3*N+1:7*N);
%q3=x_opt(1:3*N);
z1=6*ones(1,N)';
z2=-6*ones(1,N)';
y=zeros(N,1);
z=zeros(N,1);
y(1:N,1)=q1(1:N).*y1(1:N)+(1-q1(1:N)).*y2(1:N);
z(1:N,1)=q1(1:N).*z1(1:N)+(1-q1(1:N)).*z2(1:N);

end