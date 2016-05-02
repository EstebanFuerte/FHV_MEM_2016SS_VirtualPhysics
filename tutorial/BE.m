function [ y, t_vec] = BE(A,b,c,d,u,h,t_end,x0 )
%BACKWARDEULER Summary of this function goes here
%   Detailed explanation goes here

aSv = length(A);                  	% amount of state vatiables
vectorLength = length(0:h:t_end);	% length of vecotr
i = 1;                              % counting variable

x = zeros(aSv,vectorLength);        % fill a vector with zeros
x(:,i) = x0;                        % replace first element of x vector

y = zeros(size(c,1),vectorLength);  % fill a matix with zeros

%Calculation of the forward euler like:02_BasicsAndEulerSolver.pdf:slide 39
for t = 0:h:t_end
    x(:,i +1) = inv(eye(length(A))-A*h) * (x(:,i)+ b*u*h);
    % for Plotting
    t_vec(i) = t;
    y(:,i) = c*x(:,i)+d*u;
    i = i+1;
end
%y = y(1,1:length(y)-1);

end