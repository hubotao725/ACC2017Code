result=zeros(9,4);
N=[21,61,101,201];
finalPos=[3 0;6 0;9 0;12 0;15 0;5 5;0 1;0 3;0 5];
totalTime=zeros(9,4);
for k=1:10
    for i=1:length(finalPos)
        for j=1:length(N)
            addpath('G:\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
            addpath('C:\Users\hubot\Downloads\casadi-matlabR2014a-v2.4.1-Debug');
            import casadi.*
            [x_opt,f_opt,timeConsumption]=GetOptimal(N(j),finalPos(i,:));
            disp('final pos');
            disp(finalPos(i,:));
            disp('total time');
            result(i,j)=vpa(f_opt,6);
            totalTime(i,j)=totalTime(i,j)+timeConsumption;
        end
    end
end
totalTime=totalTime/10;
MatToLatex(finalPos,totalTime,9,4);
