clear all, close all, clc;

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
h = 1000e-3;
t_end = 10;

%% Calculate and plot analitic solution -----------------------------------
i = 1;
yAn = zeros(size(0:h:t_end));
%yAn(1) = x0;
for t = 0:1e-3:t_end
    yAn(i) = x0*exp(A(1,1)*t);
    t_vec(i) = t;
    i = i+1;
end
figure
plot(t_vec,yAn,':r');hold on;

%%
[yFE,t_vec] = FE(A,b,c,d,u,h,t_end,x0);
plot(t_vec,yFE);