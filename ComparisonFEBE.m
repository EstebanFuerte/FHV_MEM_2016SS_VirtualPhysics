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

h = 1e-3;
t_end = 10;

%% -- Calcualtion of analyitc solution ------------------------------------
i = 1;
yAn = zeros(size(0:h:t_end));
yAn(1) = x0;
for t = 0:h:t_end
    yAn(i) = x0*exp(A*t);
    t_vec = t;
    i = i+1;
end
figure
plot(t_vec,yAn,'-r');


%% -- Calculation and Plot of forward euler -------------------------------
[t_vec,x] = forwardEuler(A,x0,0,10,h);

figure
plot(t_vec,x(:,1:length(x)-1)); hold on;

%-- Calcualtion and plot of backward euler --------------------------------
[t_vec,x] = backwardEuler(A,x0,0,10,h);
plot(t_vec,x(:,1:length(x)-1),'-b');

% Plot original function (stepsize fixed to 1e-3) -------------------------

plot(t_vec,yAN(:,1:length(x)-1),'-r');
legend('forward euler','backward euler','analytic');


