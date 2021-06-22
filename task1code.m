%% TASK ONE %%
%% Tasks a & b.
close all                    % Closes all current figures
% I have named a lot of the variables with
% a after to avoid issues with future code

figure(1)                    % Opens a new plot

Na   = randi([100 500],1,1); % Generates particles
theta= 360*rand(Na,1,1);     % Random angle between 0 and 360 deg
ra   = 100*rand(Na,1,1);     % Random radius less than 100 units
xa   = ra.*cosd(theta);
ya   = ra.*sind(theta);      % Polar coordinates

ha   = plot(xa,ya,'o');      % Plotting the graph
axis manual
axis([-500 500 -500 500])
daspect([1 1 1])
title('Task 1a')             % Plot title

va   = 40*rand(Na,1,1)+10;   % Random veloicty 10 ? v ? 50
vxa  = va.*cosd(theta);      % Horizontal velocity component
vya  = va.*sind(theta);      % Vertical velocity component

ta   = 0;                    % Resets the time
dta  = 2;                    % Time 'step'

while ta<=250
    ta = ta+dta;             % Updates time
    
    xa = xa+vxa.*dta;        % Updates x coordinate
    ya = ya+vya.*dta;        % Updates y coordinate
    ha.XData = xa;           % Plots the updated x coordinate
    ha.YData = ya;           % Plots the updated y coordinate
    drawnow 
    pause(0.005)             % Leaves a 0.05 second gap before continuing
    
    wallxa = find(abs(xa) >= 500); % Finds any x value outside the bounds
    wallya = find(abs(ya) >= 500); % Finds any y value outside the bounds
    vxa(wallxa) = vxa(wallxa)*-1;  % Flips vxa of x value outside bound
    vya(wallya) = vya(wallya)*-1;  % Flips vya of y value outside bound
    
    if mod(ta,10)==0 && ta<=250
        filename=['screenshot_taskb_' num2str(ta/10) '.png'];
        saveas(gcf,filename)
    end
end

%% Task c. 

figure(2)                    % New figure 
Nc=randi([10 15]);
thetac=360*rand(1,Nc);
vc=rand(1,Nc)*40+10;
vxc=vc.*cosd(thetac);
vyc=vc.*sind(thetac);
xc=zeros(1,Nc);              % Creates an array of all zeroes, size 1 x Nc
yc=zeros(1,Nc);              
hc=plot(xc,yc,'o');
hold on
axis([-500 500 -500 500])
axis manual
daspect([1 1 1])
Xc=[xc];                     % Adds the current xc value to a vector 'Xc'
Yc=[yc];                     % Adds the current yc value to a vector 'Yc'
for i=1:Nc                   % For 'Nc' times:
    trc(i)=plot(Xc(:,i),Yc(:,i),'-k'); % Plots the trace
end
tc=0;   % Resets the timer
dtc=1;  % Time step 
title('Task c')              % New title

while tc<=100
    tc = tc+dtc;
    xc=xc+vxc*dtc;
    yc=yc+vyc*dtc;   
    wallxc = find(abs(xc) >= 500); % Finds any x value outside the bounds
    wallyc = find(abs(yc) >= 500); % Finds any y value outside the bounds
    vxc(wallxc) = vxc(wallxc)*-1;  % Flips vxc of x value past width bound
    vyc(wallyc) = vyc(wallyc)*-1;  % Flips vyc of y value past top/bottom
    Xc=[Xc; xc];    % Adds new value of xc to Xc vector
    Yc=[Yc; yc];    % Adds new value of yc to Yc vector
    hc.XData=xc;   
    hc.YData=yc;
    for i=1:Nc      % For Nc times
        trc(i).XData=Xc(:,i);   % This is the x data 
        trc(i).YData=Yc(:,i);   % This is the y data
    end
    drawnow;    
    if tc==99      % Takes a screenshot at the end of the loop.
        filenamec=['screenshot_taskc.png'];
        saveas(gcf,filenamec)
    end    
end

%% Task d.

figure(3)                    % New figure
Nd   = randi([40 60],1,1);   % Random integer between 40 and 60
theta= 360*rand(Nd,1,1);     % Random angle
rd   = 100*rand(Nd,1,1);     % Random radius
xd   = rd.*cosd(theta);      % Polar coordinate for x
yd   = rd.*sind(theta);      % Polar coordinate for y 
hd   = plot(xd,yd,'o');      % Plots x against y 
axis manual 
axis([-500 500 -500 500])
daspect([1 1 1])
title('task d')              % New Title
vd   = 40*rand(Nd,1,1)+10;   % Random velocity between 10 and 50
vxd  = vd.*cosd(theta);
vyd  = vd.*sind(theta);
td   = 0;
dtd  = 1;
g    = 9.8;                  % Defines gravity
figure(6)                    % For task f
title('Total Energy, Task d')
en_d  = ones(Nd,1);          % Task f)
toten= plot(td,sum(en_d),'c+:');    % Task f)
hold on                      % Task f)
axis manual                  % Task f)
axis([0 170 0 (Nd+5)])       % Task f)
while td<=150
    td = td+dtd;             % Time ticks
    vyd=vyd-g*dtd;           % Gravity now has an effect on vertical 
                             % component of velocity of particles
    xd = xd+vxd.*dtd;
    yd = yd+vyd.*dtd; 
    hd.XData = xd;  
    hd.YData = yd;
    drawnow
    pause(0.005) 
    wallxd = find(abs(xd) >= 500);  % Finds particles outside walls
    wallyd = find(abs(yd) >= 500);  % Finds particles outside top/bottom
    vxd(wallxd) = vxd(wallxd)*-1;   % Bounces against walls
    vyd(wallyd) = vyd(wallyd)*-1;   % Bounces against bottom/top bounds
    toten.XData = td;           % Task f)
    toten.YData = sum(en_d);    % Task f)
    sum(en_d)                   % Task f)
    if mod(td,10)==0 && td<=250 % For 10, 20, 30...240, 250:
        filename=['screenshot_taskd_' num2str(td/10) '.png'];
        saveas(gcf,filename)    % Take a screenshot of the figure
    end
end

%% Task e.
figure(4)                       % New figure
Ne   = randi([30 50],1,1);      % Random number
theta= 360*rand(Ne,1,1);        % Random angle
re   = 100*rand(Ne,1,1);        % Random radius
xe   = re.*cosd(theta);         % Polar x coordinate
ye   = re.*sind(theta);         % Polar y coordinate
he   = plot(xe,ye,'o');         % Plots x against y
axis manual 
axis([-500 500 -500 500])
title('Task e')
daspect([1 1 1])
ve   = 40*rand(Ne,1,1)+10;      % Random velocity between 10 and 50
vxe  = ve.*cosd(theta);         % x component of velocity
vye  = ve.*sind(theta);         % y component of velocity
te   = 0;             
dte  = 1;          
figure(5)                       % New figure for task f)
en   = ones(Ne,1);              % Energy of all particles = 1 (100%)
toten= plot(te,sum(en),'c+:');  % Plots the time against sum of energies
hold on                         
axis manual    
title('Total Energy Task e')
axis([0 170 0 (Ne+5)])          % Size of axis
while te<=150                   
    te = te+dte;                % Time tick
    hold on     
    xe = xe+vxe.*dte;           % Updates x position  
    ye = ye+vye.*dte;           % Updates y position
    he.XData = xe;              % Plots new x coordinate
    he.YData = ye;              % Plots new y coordinate
    toten.XData = te;           % x data of task f) plot is time
    toten.YData = sum(en);      % y data of task f) plot is sum of en
    hold on
    drawnow
    pause(0.01) 
    wallxe = find(abs(xe) >= 500);  % Finds particles outside walls
    wallye = find(abs(ye) >= 500);  % Finds particles outside top/bottom
    en(wallxe)  = 0.9 * en(wallxe); % Decreases particle energy by 10%
    en(wallye)  = 0.9 * en(wallye); % Decreases particle energy by 10%
    vxe(wallxe) = vxe(wallxe)*-1.*en(wallxe);  % The energy now has an 
    vye(wallye) = vye(wallye)*-1.*en(wallye);  % effect on velocity
    sum(en)     % Prints the sum of the energy. I used this as a check.
end