% Author: Stefan Stark
% Date: 20160429
% FHV - MEM - SS2016
% Comparison between backward euler and forward euler

clear all; close all; clc;

% Parameters
A = -1;
c = 1;

% Initial Conditions
x0 = 1;

h = 2000e-3;

%-- Calculation and Plot of forward euler ---------------------------------
[t_vec,x] = forwardEuler(A,x0,0,10,h);

figure
plot(t_vec,x(:,1:length(x)-1)); hold on;

%-- Calcualtion and plot of backward euler --------------------------------
[t_vec,x] = backwardEuler(A,x0,0,10,h);
plot(t_vec,x(:,1:length(x)-1),'-b');

% Plot original function (stepsize fixed to 1e-3) -------------------------
i = 1;
x = zeros(size(0:1e-3:10));
x(i) = x0;
for t = 0:1e-3:10
    %FE
    dx_dt(i) = A*x(i);
    x(i+1) = x(i) + dx_dt(i)*1e-3;
    
    
    % for plotting
    t_vec(i) = t;
    i = i+1;
end
plot(t_vec,x(:,1:length(x)-1),'-r');
legend('forward euler','backward euler','original');


