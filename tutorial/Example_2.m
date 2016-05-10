% Author: Barth Benjamin, Mathis René, Stefan Stark
% Date: 20160509
% FHV - MEM - SS2016
% Tutorial Task 5.3 Something to Compare With or Self-Validation

clc; clear all; close all;

%% Inputs
u= 30;

%% Parameters
R= 10e-3; % in Ohm
L= 1e-3; % in Henry
psi= 0.1; % in Vs
b= 0.1; % in kg*m/s
J= 10e-3; %in kg*m²


%% State-Space Representation of the System
% state variables:
% x1 = i
% x2 = w

a11= -R/L;
a12= -psi/L;
a21= psi/J;
a22= -b/J;

A=[a11, a12; a21 a22];
b=[1/L;0];

c=[1 0]; %output-variable is armature current of the motor (X1)
d=0;

%[yFE, t_vec] = FE(A,b,c,d,u,h,t_end,x0);

%Initial condition of state-variable
x0=0;

%Step-Size:
h=[500e-6 1e-3 5e-3 15e-3 20e-3 50e-3];
t_end=1;

%Validation of result using lsim-command:
sys = ss(A,b,c,d);
poles=eig(A)
t = 0:1e-3:t_end;
u1 = u*ones(size(t));   %Generation of u-vector of same size as t.
y=lsim(sys,u1,t);
 
figure
for i=1:6
subplot(2,3,i);
plot(t,y); hold on;

title(['h=',num2str(h(i)),'s'])
xlabel('Time in Seconds');
ylabel('Armature-current in Ampere');


[yFE, t_vec] = FE(A,b,c,d,u,h(i),t_end,x0);
[yBE, t_vec] = BE(A,b,c,d,u,h(i),t_end,x0);
[yAB3, t_vec] = AB3(A,b,c,d,u,h(i),t_end,x0);
[yRK4, t_vec] = RK4(A,b,c,d,u,h(i),t_end,x0);
[yBDF3, t_vec] = BDF3(A,b,c,d,u,h(i),t_end,x0);

plot(t_vec,yFE);
plot(t_vec,yBE);
plot(t_vec,yAB3);
plot(t_vec,yRK4);
plot(t_vec,yBDF3); hold off;

legend('lsim','FE','BE','AB3','RK4','BDF3');

% Scale plot
if (min(yFE) < -200 || min(yBE)< -200 || min(yBDF3) < -200 || min(yAB3) < -200 || min(yRK4) < -200)
    ymin = -500;
else 
    ymin = -100;
end

if (max(yFE) > 1000 || max(yBE)> 1000 || max(yBDF3) >  1000 || max(yAB3) >  1000 || max(yRK4) >  1000)
    ymax = 1300;
else 
    ymax = 900;
end

axis([0 t_end ymin ymax]);

end