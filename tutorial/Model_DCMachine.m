% Author: Barth Benjamin, Mathis René, Stefan Stark
% Date: 20160430
% FHV - MEM - SS2016
% Model_DCMachine

clc; clear all; close all;

%% Inputs
u= 30;

%% Parameters
R= 10e-3; % in Ohm
L= 1e-3; % in Henry
psi= 0.1; % in Vs
b= 0.1; % in kg*m/s
J= 10e-3 %in kg*m²

%% State-Space Representation of the System
% state variables:
% x1 = i
% x2 = w
% conflict appears at the I:m element thus no state variable is introduced

a11= -R/L;
a12= -psi/L;
a21= psi/J;
a22= -b/J;

A=[a11, a12; a21 a22];
b=[1/L;0];

c=[1 1]; %output-variable is angular velocity of the motor
d=0;

%[yFE, t_vec] = FE(A,b,c,d,u,h,t_end,x0);
sys = ss(A,b,c,d);
eig(A)
t = 0:1e-3:1;
u = 30*ones(size(0:1e-3:1));
y=lsim(sys,u,t);
figure
plot(t,y); hold on;

h = 1e-3;
[yFE, t_vect] = FE(A,b,c,d,u,h,1,0);
plot(t_vect,yFE)
