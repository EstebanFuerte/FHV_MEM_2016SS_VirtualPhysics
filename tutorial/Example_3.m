% Author: Barth Benjamin, Mathis René, Stefan Stark
% Date: 20160502
% FHV - MEM - SS2016
% Simulating a Mechatronic System

clear all; clc; close all;

%inputs
u = 18;      % dc-motor armature-voltage

m = 15;
g = -9.81;
Fg = m * g;  % gravitational force

% Parameter

Ra = 0.75;  % [Ohm]
La = 10e-3; % [H]
b1 = 200;   % [Ns/m] - also use 0.25
b2 = 50;    % [Ns/m] - also use 10e-3
b3 = 0.25;  % [Ns/m]
J1 = 50e-2; % [kgm^2]
J2 = 20e-3; % [kgm^2]
k1 = 10;    % [N/m]
k2 = 250;   % [N/m]
r = 0.1;    % [m]
psi = 0.66; % [Vs]

%% State-Space Representation of the System
% state variables:
% x1 = ia
% x2 = w1
% x3 = w2
% x4 = Tk1
% x5 = Fk2
% conflict appears at the I:m element thus no state variable is introduced

Jtot = J2 + r^2*m;
a11 = -Ra/La;
a12 = -psi/La;
a21 = psi/J1;
a22 = -(b1+b3)/J1;
a23 = b1/J1;
a32 = b1/Jtot;
a33 = -(b1 + r^2*b2)/Jtot;
a34 = -1/Jtot;
a35 = -r/Jtot;
a43 = k1;
a53 = k2*r;

 A = [a11 a12 0 0 0;
      a21 a22 a23 0 0;
      0 a32 a33 a34 a35;
      0 0 a43 0 0;
      0 0 a53 0 0];

b = [1/La 0 0 0 0; 0 0 r/Jtot 0 0]';
cT = [0 0 r 0 0;  0 0 1 0 0]; % output = x3 = w2

d = zeros(2,2);

%% -- Plot result ---------------------------------------------------------

% Definition des Schrittweitenvektors
h = [0.1e-3 0.5e-3 1.00e-3 1.5e-3 ];

sys = ss(A,b,cT,d);
eig(A)
t_end = 10e-3;
h_lsim = min(h);
t = 0:h_lsim:t_end;
u2 = [u;Fg];
u1 = [u*ones(size(0:h_lsim:t_end));Fg*ones(size(0:h_lsim:t_end))];
y=lsim(sys,u1,t);

figure
for i = 1:4
    subplot(2,2,i);
    plot(t,y(:,2)); hold on;

    title(['h=',num2str(h(i)),'s']);
    xlabel('Time in Seconds');
    ylabel('angular velocity in rad/s');

    [yFE, t_FE] = FE(A,b,cT,d,u2,h(i),t_end,0);
    [yBE, t_BE] = BE(A,b,cT,d,u2,h(i),t_end,0);
    [yAB3, t_AB] = AB3(A,b,cT,d,u2,h(i),t_end,0);
    [yRK4, t_RK] = RK4(A,b,cT,d,u2,h(i),t_end,0);
    [yBDF3, t_BDF] = BDF3(A,b,cT,d,u2,h(i),t_end,0);

    plot(t_FE,yFE(2,:))
    plot(t_BE,yBE(2,:))
    plot(t_AB,yAB3(2,:))
    plot(t_RK,yRK4(2,:))
    plot(t_BDF,yBDF3(2,:))
    
    miny = min(y(:,2));     % find minimum y value of the lsim simulation
    maxy = max(y(:,2));     % find maximum y value of the lsim simulation
    
    % Scale plot
    if (min(yFE(2,:)) < miny || min(yBE(2,:))< miny || ...
            min(yBDF3(2,:)) < miny || min(yAB3(2,:)) < miny ||...
            min(yRK4(2,:)) < miny)
        ymin = miny*1.1;
    else 
        ymin = miny;
    end

    if (max(yFE(2,:)) > maxy || max(yBE(2,:))> maxy || ...
            max(yBDF3(2,:)) >  maxy || max(yAB3(2,:)) >  maxy ||...
            max(yRK4(2,:)) > maxy)
        ymax = maxy*1.1;
    else 
        ymax = maxy;
    end
    axis([0 t_end ymin ymax]);
    legend('lsim','FE','BE','AB3','RK4','BDF3');
end