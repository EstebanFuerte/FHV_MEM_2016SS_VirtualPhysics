% FH Vorarlberg
% University of Applied Siences
% Course:   Numerische Simulation physikalischer Systeme
% Authors:  Barth Benjamin, Mathis René, Stark Stefan

function [y,t_vec] = BDF3(A, b, c, d, u, h, t_end, x0 )
% BDF3 creates a Newton-Gregory-Polynomial
% formulate it for x(t) at t_k+1

aSv = length(A);                  	% amount of state vatiables
vectorLength = length(0:h:t_end);	% length of vecotr
i = 1;                              % counting variable

x = zeros(aSv,vectorLength);        % fill a vector with zeros
x(:,i) = x0;                        % replace first element of x vector

y = zeros(size(c,1),vectorLength);  % fill a matix with zeros

x(:,i+1) = (eye(length(A))-A*h)^-1 * x(:,i) + b*u*h;
x(:,i+2) = (eye(length(A))-A*h)^-1 * x(:,i+1) + b*u*h;

%Calculation of BDF3
for t = 0:h:t_end;  
    x(:,i+3) = (inv(eye(length(A))-A*h*(6/11))) * ((18/11)*x(:,i+2) - (9/11)*x(:,i+1) + (2/11)*x(:,i) + (b*u*(6/11)*h));
    y(:,i) = c*x(:,i)+d*u; 
    %for plotting
    t_vec(i) = t;
    i = i+1;
end
%y = y(1,1:length(y)-3);