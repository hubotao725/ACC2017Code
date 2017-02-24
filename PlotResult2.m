function PlotResult2(pltY,pltZ,pltTheta,N,h)
%PlotResult this function will plot the result of the velocity
%yres is the result of the optimal solution. It is a matrix.
%zres is the result of the optimal solution. It is a matrix. 
%theta is the result of the solution. It is a matrix. 
%thrust is the thrust vector
%N is the number of the samples

LineWidth=1.5;
IMG_WIDTH=5;
IMG_HEIGHT=5;
STEP=4;
 
c=colormap(jet(N));
hold on
for i=1:STEP:N
    DrawQuad2D(pltY(i,1),pltZ(i,1),pltTheta(i,1),c(i,:));
end
plot(pltY(1:N,1),pltZ(1:N,1),'k','LineWidth',1.5);
hold off

axis equal
xlim([-0.5,16.5]);
ylim([-2.5,2.5]);
FontSize=7;
xlabel('x position (m)','FontSize',FontSize);
ylabel('z position (m)','FontSize',FontSize);
title('Time optimal maneuver','FontSize',FontSize);

set(h,'paperunits','centimeters');
set(h,'papersize',[IMG_WIDTH IMG_HEIGHT]);
set(h,'paperposition',[0,0,IMG_WIDTH,IMG_HEIGHT]);  
set(gca,'FontSize',FontSize);
print -dpdf trajectory.pdf

end

