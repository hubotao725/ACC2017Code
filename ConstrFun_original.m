function g=ConstrFun_original(b,N)
%ConstrFun this is the function that generate the constraint
%b is the state
%g is the constraint
addpath('G:\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
import casadi.*
GRAVITY=9.81;
g=SX(7*N+3,1);
g(1)=b(1);
for i=2:N
    g(i)=b(i)-b(i-1)-1/(N-1)*b(i+N-1);
    g(i+N)=b(i+N)-b(i+N-1)-1/(N-1)*b(i+2*N-1);
    g(i+2*N)=b(i+3*N)-b(i+3*N-1)-1/(N-1)*b(i+4*N-1);
    g(i+3*N)=b(i+4*N)-b(i+4*N-1)-1/(N-1)*b(i+5*N-1);
    g(i+4*N)=b(i+5*N)-b(i+5*N-1)-1/(N-1)*b(i+6*N-1);
end
g(N+1)=b(N);
g(2*N+1)=b(3*N+1)-0.5;
g(3*N+1)=b(4*N+1);
g(4*N+1)=b(5*N+1);
g(7*N+1)=b(4*N)-0.5;
g(7*N+2)=b(5*N);
g(7*N+3)=b(6*N);

ceq=[];
c=[];
 GRAVITY=10;
syms s real;
xtraja=15*(s^5+5*s^4*(1-s)+10*s^3*(1-s)^2);
xtrajb=15*(s^5+5*s^4*(1-s)+10*s^3*(1-s)^2);
funXA=xtraja;
funXPA=diff(xtraja,s);
funXPPA=diff(funXPA,s);
funXPPPA=diff(funXPPA,s);
xA=@(val) double(subs(funXA,s,val));

parxA=@(val) double(subs(funXPA,s,val));
pparxA=@(val) double(subs(funXPPA,s,val));
ppparxA=@(val) double(subs(funXPPPA,s,val));

funXB=xtrajb;
funXPB=diff(funXB,s);
funXPPB=diff(funXPB,s);
funXPPPB=diff(funXPPB,s);
xB=@(val) double(subs(funXB,s,val));
parxB=@(val) double(subs(funXPB,s,val));
pparxB=@(val) double(subs(funXPPB,s,val));
ppparxB=@(val) double(subs(funXPPPB,s,val));

ztraja=1;
ztrajb=-1;
funZA=ztraja;
funZPA=diff(funZA,s);
funZPPA=diff(funZPA,s);
funZPPPA=diff(funZPPA,s);

zA=@(val) double(subs(funZA,s,val));
parzA=@(val) double(subs(funZPA,s,val));
pparzA=@(val) double(subs(funZPPA,s,val));
ppparzA=@(val) double(subs(funZPPPA,s,val));

funZB=ztrajb;
funZPB=diff(funZB,s);
funZPPB=diff(funZPB,s);
funZPPPB=diff(funZPPB,s);
zB=@(val) double(subs(funZB,s,val));
parzB=@(val) double(subs(funZPB,s,val));
pparzB=@(val) double(subs(funZPPB,s,val));
ppparzB=@(val) double(subs(funZPPPB,s,val));
ceq=[];
c=[];
 
q1=b(3*N+1:7*N);
q3=b(1:3*N);
 
for i=1:N
    curState=1/(N-1)*(i-1);
    xddot=(parxA(curState)*q1(i)+q1(i+N)*xA(curState))*q3(i+N)/2+...
          (pparxA(curState)*q1(i)+2*q1(i+N)*parxA(curState)+q1(i+2*N)*xA(curState))*q3(i)+...
          (parxB(curState)*(1-q1(i))+(-q1(i+N))*xB(curState))*q3(i+N)/2+...
          (pparxB(curState)*(1-q1(i))+2*(-q1(i+N))*parxB(curState)+(-q1(i+2*N))*xB(curState))*q3(i);
    zddot=(parzA(curState)*q1(i)+q1(i+N)*zA(curState))*q3(1+N)/2+...
          (pparzA(curState)*q1(i)+2*q1(i+N)*parzA(curState)+q1(i+2*N)*zA(curState))*q3(i)+...
          (parzB(curState)*(1-q1(i))+(-q1(i+N))*zB(curState))*q3(i+N)/2+...
          (pparzB(curState)*(1-q1(i))+2*(-q1(i+N))*parzB(curState)+(-q1(i+2*N))*zB(curState))*q3(i);    
      
    xdddot=q3(i+2*N)*sqrt(q3(i))*(parxA(curState)*q1(i)+q1(i+N)*xA(curState))/2+...
           q3(i)*sqrt(q3(i))*(2*pparxA(curState)*q1(i+N)+3*q1(i+2*N)*parxA(curState)+q1(i+3*N)*xA(curState))+...
           3*q3(i+N)*sqrt(q3(i))*(2*q1(i+N)*parxA(curState)+pparxA(curState)*q1(i)+q1(i+2*N)*xA(curState))/2+...
           sqrt(q3(i))*q3(i)*(pparxA(curState)*q1(i+N)+ppparxA(curState)*q1(i))+...
           q3(i+2*N)*sqrt(q3(i))*(parxB(curState)*(1-q1(i))+(-q1(i+N))*xB(curState))/2+...
           q3(i)*sqrt(q3(i))*(2*pparxB(curState)*(-q1(i+N))+3*(-q1(i+2*N))*parxB(curState)+(-q1(i+3*N))*xB(curState))+...
           3*q3(i+N)*sqrt(q3(i))*(2*(-q1(i+N))*parxB(curState)+pparxB(curState)*(1-q1(i))+(-q1(i+2*N))*xB(curState))/2+...
           sqrt(q3(i))*q3(i)*(pparxB(curState)*(-q1(i+N))+ppparxB(curState)*(1-q1(i)));
       
    zdddot=q3(i+2*N)*sqrt(q3(i))*(parzA(curState)*q1(i)+q1(i+N)*zA(curState))/2+...
           q3(i)*sqrt(q3(i))*(2*pparzA(curState)*q1(i+N)+3*q1(i+2*N)*parzA(curState)+q1(i+3*N)*zA(curState))+...
           3*q3(i+N)*sqrt(q3(i))*(2*q1(i+N)*parzA(curState)+pparzA(curState)*q1(i)+q1(i+2*N)*zA(curState))/2+...
           sqrt(q3(i))*q3(i)*(pparzA(curState)*q1(i+N)+ppparzA(curState)*q1(i))+...
           q3(i+2*N)*sqrt(q3(i))*(parzB(curState)*(1-q1(i))+(-q1(i+N))*zB(curState))/2+...
           q3(i)*sqrt(q3(i))*(2*pparzB(curState)*(-q1(i+N))+3*(-q1(i+2*N))*parzB(curState)+(-q1(i+3*N))*zB(curState))+...
           3*q3(i+N)*sqrt(q3(i))*(2*(-q1(i+N))*parzB(curState)+pparzB(curState)*(1-q1(i))+(-q1(i+2*N))*zB(curState))/2+...
           sqrt(q3(i))*q3(i)*(pparzB(curState)*(-q1(i+N))+ppparzB(curState)*(1-q1(i)));  
   
      
   
    g(i+5*N)=sqrt(xddot^2+(zddot+GRAVITY)^2);
        %g(i+6*N)=SX(10);
    g(i+6*N)=((zddot+GRAVITY)*xdddot-zdddot*xddot)/(xddot^2+(zddot+GRAVITY)^2);

end
    
 
end    


    