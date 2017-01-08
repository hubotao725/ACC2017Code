clear all;
close all;
import casadi.*
 
% Create NLP: Solve the Rosenbrock problem:
%     minimize    x^2 + 100*z^2
%     subject to  z + (1-x)^2 - y == 0
x = SX.sym('x');
y = SX.sym('y');
z = SX.sym('z');
v = [x;y;z];
f = x^2 + 100*z^2;
g=SX(2,1);
g(1) = z + (1-x)^2 - y;
g(2)= z+(1-x)^3;
nlp = SXFunction('nlp', nlpIn('x',v),nlpOut('f',f','g',g));

% Create IPOPT solver object
solver = NlpSolver('solver', 'ipopt', nlp);

% Solve the NLP
arg = struct;
arg.x0 = [2.5 3.0 0.75]; % solution guess
arg.lbx = -inf; % lower bound on x
arg.ubx =  inf; % upper bound on x
arg.lbg =    [0;0]; % lower bound on g
arg.ubg =    [0;0]; % upper bound on g
res = solver(arg);
 
% Print the solution
f_opt = full(res.f)          % >> 0
x_opt = full(res.x)          % >> [0; 1; 0]
lam_x_opt = full(res.lam_x)  % >> [0; 0; 0]
lam_g_opt = full(res.lam_g)  % >> 0