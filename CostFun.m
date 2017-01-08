function [f]=CostFun(b,N)
%CostFun this is the cost function
%b is the state
%f is the value
% f=0;
% for i=2:N
%     f=f+2/(N-1)/(sqrt(b(i-1))+sqrt(b(i)));
% end
import casadi.*
f=b(8*N+1);
end