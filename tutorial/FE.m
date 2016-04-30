function [x,t_vec] = FE(A, b, c, d, u, h, t_end, x0 )
%FORWARDEULER returns time vector (for plotting) and state variable based
%on the forward euler
%   Detailed explanation goes here


i = 1;
x = zeros(size(0:h:t_end));
x(i) = x0;

%Calculation of the forward euler like:02_BasicsAndEulerSolver.pdf:slide 32
for t = 0:h:t_end
    %FE
    dx_dt(i) = A*x(i)+d*u;
    x(i+1) = x(i) + dx_dt(i)*h;
    % for plotting
    t_vec(i) = t;
    i = i+1;
end



end

