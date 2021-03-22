syms x
y  = (-3) * x^3 + (12)* x^2 + (-9) * x - 9   % My function, y(x)
dy = diff(y)                % Differentiates y                      
format long                 % Shows to 15 digits
sp = double(solve(dy,0))    % Finds Stationary Points
d2 = diff(dy)               % Second Derivative of y
cl = double(subs(d2,x,sp)); % Stationary Pt -> Second Derivative
mn = find(cl > 0);          % Finds when 2nd Deriv is positive
minimum_points = cl(mn)     % This is a minimum point.
mx = find(cl < 0);          % Finds when 2nd Deriv is negative
maximum_points = cl(mx)     % This is a maximum point.
figure()                    % Opens an empty figure
fplot(y)                    % Plots y(x)
hold on                     % Holds the current plot
axis manual                 % Freezes any scaling 
axis([-1 4 -12 0])          % Sets axis limits
pp1 = subs(y,x,sp(1));      % Finds the y value of the first SP
pp2 = subs(y,x,sp(2));      % Finds the y value of the second SP 
plot(sp(1),pp1,'o','MarkerFaceColor','m')
text(sp(1),pp1,'  minima')  % Plots 'minima' at the first SP
plot(sp(2),pp2,'o','MarkerFaceColor','m')
text(sp(2),pp2,'  maxima')  % Plots 'maxima' at the second SP
% Because I have one real root, I will use the 
% first stationary point and the real root
root = double(solve(y==0))  % Finds the roots of y(x)
integral = abs(double(int(y,root(1),sp(1))))  
                            % Finds int of y between the root & first SP.