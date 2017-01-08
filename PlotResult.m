function PlotResult(pltY,pltZ,pltTheta,N,Ts)
%PlotResult this function will plot the result of the velocity
%yres is the result of the optimal solution. It is a matrix.
%zres is the result of the optimal solution. It is a matrix. 
%theta is the result of the solution. It is a matrix. 
%thrust is the thrust vector
%N is the number of the samples

figure(6);
lastStep=1;
for i=1:N
    h1=subplot(3,1,1);
    xlim([-0.5,6.5]);
    ylim([-0.3,0.3]);
    
    axis equal
    hold on;
    
    curStep=floor(i/(N-1)*5)*(N-1)/5+1;
    if lastStep~=curStep
        disp(lastStep);
        lastStep=curStep;
    else
        if i>=3
        DrawQuad2D(pltY(i-1,1),pltZ(i-1,1),pltTheta(i-1,1),'w');
        end
    end
    DrawQuad2D(pltY(i,1),pltZ(i,1),pltTheta(i,1),'k');
    if i>=2
        plot(pltY(i-1:i,1),pltZ(i-1:i,1),'r');
    end
    hold off;
    subplot(3,1,2);
    if i>=2
    hold on;
    xlim([0,pltY(N,1)+0.5]);
    plot(pltY(i-1:i,1),pltY(i-1:i,2),'r');
    hold off;
    subplot(3,1,3);
    hold on;
    xlim([0,pltY(N,1)+.5]);
    plot(pltY(i-1:i,1),pltTheta(i-1:i,2),'r');
    hold off;
    end
    pause(0.01);
end
end


