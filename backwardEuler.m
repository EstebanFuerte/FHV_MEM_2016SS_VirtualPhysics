function [ t_vec,x ] = backwardEuler(A,x0,t_start,t_end,h )
%BACKWARDEULER Summary of this function goes here
%   Detailed explanation goes here

i = 1;
x = zeros(size(t_start:h:t_end));
x(i) = x0;

%Calculation of the forward euler like:02_BasicsAndEulerSolver.pdf:slide 39
for t = t_start:h:t_end
    % BE
    x(i+1) = (1-A*h)^-1 * x(i);
    % for Plotting
    t_vec(i) = t;
    i = i+1;
end

end

