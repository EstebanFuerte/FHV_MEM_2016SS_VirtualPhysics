% Author: Stefan Stark
% Date: 20160429
% FHV - MEM - SS2016
% Testing Stability of the forward euler: 02_BasicsAndEulerSolver.pdf - 32

clear all; close all; clc;

% Parameters
A = -1;
c = 1;

% Initial Conditions
x0 = 1;

% Simulation Properties
t_start = 0;
t_end = 10;
h = 1e-3;

% Aritificial Variables
i = 1;
x = zeros(size(t_start:h:t_end));
x(i) = x0;

for t = t_start:h:t_end
    %FE
    dx_dt(i) = A*x(i);
    x(i+1) = x(i) + dx_dt(i)*h;
    
    
    % for plotting
    t_vec(i) = t;
    i = i+1;
end

% Plot forward euler ------------------------------------------------------
figure
plot(t_vec,x(:,1:length(x)-1)); hold on;


% Plot original function (stepsize fixed to 1e-3) -------------------------
i = 1;
x = zeros(size(t_start:1e-3:t_end));
x(i) = x0;
for t = t_start:1e-3:t_end
    %FE
    dx_dt(i) = A*x(i);
    x(i+1) = x(i) + dx_dt(i)*1e-3;
    
    
    % for plotting
    t_vec(i) = t;
    i = i+1;
end
plot(t_vec,x(:,1:length(x)-1),'-r');


