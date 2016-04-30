% Author: Barth Benjamin, Mathis René, Stefan Stark
% Date: 20160430
% FHV - MEM - SS2016
% Tutorial Task 5.3 Something to Compare With or Self-Validation

clear all; close all; clc;

% Parameters
A = -1;
b = 0;
c = 1;
d = 0;
u = 0;

% Initial Conditions
x0 = 1;

% Stepwidth
h = 2000e-3;
t_end = 10;

%% Calculate and plot analitic solution -----------------------------------
i = 1;
yAn = zeros(size(0:h:t_end));
yAn(1) = x0;
for t = 0:1e-3:t_end
    yAn(i) = x0*exp(A*t);
    t_vec(i) = t;
    i = i+1;
end
figure
plot(t_vec,yAn,'-r');hold on;

%% -- Calculation and Plot of forward euler -------------------------------
[yFE,t_vec] = FE(A,b,c,d,u,h,t_end,x0);
plot(t_vec,yFE(:,1:length(yFE)-1));

%% -- Calcualtion and plot of backward euler ------------------------------
[yBE,t_vec] = BE(A,b,c,d,u,h,t_end,x0);
plot(t_vec,yBE(:,1:length(yBE)-1),'-b');
legend('analitic','FE','BE');

