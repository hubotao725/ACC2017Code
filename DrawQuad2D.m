function DrawQuad2D(x,z,theta,colorSel)
%DrawQuad2D this function draws the 2D quadrotor
%x is the horizontal position
%z is the height
%theta is the tilting angle
LineWidth=0.25;
n=length(x);
LENGTH=length(-0.25:0.05:0.25);
quadLine=[-0.25:0.05:0.25;...
          zeros(1,11)];
quadbar=[-0.25*ones(1,11);0:0.01:0.1];
quadbar2=[0.25*ones(1,11);0:0.01:0.1];


quadnew=[cos(theta) sin(theta);...
    -sin(theta) cos(theta)]*quadLine+[x;z]*ones(1,11);
quadbarres=[cos(theta) sin(theta);...
    -sin(theta) cos(theta)]*quadbar+[x;z]*ones(1,11);
quadbarres2=[cos(theta) sin(theta);...
    -sin(theta) cos(theta)]*quadbar2+[x;z]*ones(1,11);
%lot(quadnew(1,:),quadnew(2,:),'k','LineWidth',1.5);
xpos=[quadnew(1,:) quadbarres(1,:) ];
ypos=[quadnew(2,:) quadbarres(2,:) ];
plot(xpos,ypos,'Color',colorSel,'LineWidth',LineWidth);
plot(quadbarres(1,:),quadbarres(2,:),'Color',colorSel,'LineWidth',LineWidth);


plot(quadbarres2(1,:),quadbarres2(2,:),'Color',colorSel,'LineWidth',LineWidth);

end