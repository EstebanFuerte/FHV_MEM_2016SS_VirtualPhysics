% Author: Barth Benjamin, Mathis René, Stefan Stark
% Date: 20160430
% FHV - MEM - SS2016
% Tutorial Task 5.3 Something to Compare With or Self-Validation

clear all; close all; clc;

% Parameters
%A = -1;
A = [-1,0;0,-1];
b = 0;
%c = 1;
c = [0 1];
d = 0;
u = 0;

% Initial Conditions
x0 = 1;

% Stepwidth
h = 2000e-3;
t_end = 10;

%% Calculate and plot analytic solution -----------------------------------
i = 1;
yAn = zeros(size(0:h:t_end));
yAn(1) = x0;
for t = 0:1e-3:t_end
    yAn(i) = x0*exp(A(1,1)*t);
    t_x(i) = t;
    i = i+1;
end
figure
plot(t_x,yAn,':r');hold on;

%% -- Calculatoin and plot of the Runge-Kutta4 Solver
[yRK4,t_vec] = RK4(A, b, c, d, u, h, t_end, x0)
plot(t_vec,yRK4);
