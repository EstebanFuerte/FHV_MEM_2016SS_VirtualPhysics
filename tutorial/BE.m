function [ x, t_vec] = BE(A,b,c,d,u,h,t_end,x0 )
%BACKWARDEULER Summary of this function goes here
%   Detailed explanation goes here

i = 1;
x = zeros(size(0:h:t_end));
x(i) = x0;

%Calculation of the forward euler like:02_BasicsAndEulerSolver.pdf:slide 39
for t = 0:h:t_end
    % BE
    x(i+1) = (1-A*h)^-1 * x(i) + b*u;
    % for Plotting
    t_vec(i) = t;
    i = i+1;
end

end

