% Author: Barth Benjamin, Mathis René, Stefan Stark
% Date: 20160502
% FHV - MEM - SS2016
% Tutorial - Example: Simulating a Scalar System


clear all; clc; close all;

% Parameters
A = [-1,0;0,-1];
b = 0;
c = [0 1];
d = 0;
u = 0;

% Initial Conditions
x0 = 1;

% Stepwidth
h = [1e-3,10e-3,100e-3,1000e-3,2000e-3,3000e-3];
t_end = 10;

%% Calculate and plot analitic solution -----------------------------------
i = 1;
yAn = zeros(size(0:h:t_end));
%yAn(1) = x0;
for t = 0:1e-3:t_end
    yAn(i) = x0*exp(A(1,1)*t);
    t_x(i) = t;
    i = i+1;
end

figure
for i=1:6
    subplot(2,3,i);
    plot(t_x,yAn,':r');hold on;

    %% -- Calculation and Plot of forward euler -------------------------------
    [yFE,t_vec] = FE(A,b,c,d,u,h(i),t_end,x0);
    [yBE,t_vec] = BE(A,b,c,d,u,h(i),t_end,x0);
    [yAB3,t_vecAB] = AB3(A,b,c,d,u,h(i),t_end,x0);
    [yRK4,t_vec] = RK4(A,b,c,d,u,h(i),t_end,x0);
    [yBDF3,t_vec] = BDF3(A,b,c,d,u,h(i),t_end,x0);

    plot(t_vec,yFE);
    plot(t_vec,yBE);
    plot(t_vecAB,yAB3);
    plot(t_vec,yRK4);
    plot(t_vec,yBDF3);hold off;
    
    titleString=sprintf('h= %d', h(i));
    title(titleString);
    legend('analitic','FE','BE','AB3','RK4','BDF3');
    ylabel('state variable');
    xlabel('time in s');
    
    % Scale plot
    if (min(yFE) < 0 || min(yBE)<0 || min(yBE) < 0 || min(yAB3) < 0|| min(yRK4) < 0)
        ymin = -2;
    else 
        ymin = 0;
    end

    if (max(yFE) > 1 || max(yBE)> 1 || max(yBE) >  1 || max(yAB3) >  1|| max(yRK4) >  1)
        ymax = 2;
    else 
        ymax = 1;
    end 
    axis([0 t_end ymin ymax]);
end
