function [ y, t_vec] = BE(A,b,c,d,u,h,t_end,x0 )
%BACKWARDEULER Summary of this function goes here
%   Detailed explanation goes here

i = 1;
x = [zeros(size(0:h:t_end));zeros(size(0:h:t_end))];
u = u*ones(size(0:h:t_end));
x(:,i) = x0;
y(i) = c*x(:,i)+d*u(:,i);

%Calculation of the forward euler like:02_BasicsAndEulerSolver.pdf:slide 39
for t = 0:h:t_end
    % BE
    x(:,i+1) = inv(1-A*h)* (x(:,i) +b*u(:,i)*h);
    % for Plotting
    t_vec(i) = t;
    
    
    y(i+1) = c*x(:,i+1)+d*u(:,i);
    i = i+1;
end
y = y(1,1:length(y)-1);
end

% x(t+h) = x(t) + xpunkt(t)*h
% x(t+h) = x(t) + A*x(t+h)*h+b*u*h
% x(t+h) = inv(1-A*h) * (x(t) +b*u*h)