% FH Vorarlberg
% University of Applied Siences
% Course:   Numerische Simulation physikalischer Systeme
% Authors:  Barth Benjamin, Mathis René, Stark Stefan

function [y,t_vec] = RK4(A, b, c, d, u, h, t_end, x0)

aSv = length(A);                  	% amount of state vatiables
vectorLength = length(0:h:t_end);	% length of vecotr
i = 1;                              % counting variable

x = zeros(aSv,vectorLength);        % fill a vector with zeros
x(:,i) = x0;                        % replace first element of x vector

y = zeros(size(c,1),vectorLength);  % fill a matix with zeros

for t = 0 :h: t_end      %Implementation of RK4 according 03_RungeKuttaAndStability/Slide 21 

    dx_dt = A*x(:,i) + b*u;                 %Zustandsraumdarstellung

    xP1 = x(:,i) + h/2 * dx_dt ;
    dxP1_dt = A* xP1 + b*u ;

    xP2 = x(:,i) + h/2 * dxP1_dt ;
    dxP2_dt = A* xP2 + b*u ;

    xP3 = x(:,i) + h* dxP2_dt ;
    dxP3_dt = A* xP3 + b*u ;

    x(:,i +1) = x(:,i) + (h/6)*(dx_dt + 2* dxP1_dt + 2* dxP2_dt + dxP3_dt );
    y(:,i)=c*x(:,i)+d*u;
    % for Plotting
    t_vec (i) = t;
    i = i+1;
end

%y = y(1,1:length(y)-1);
end