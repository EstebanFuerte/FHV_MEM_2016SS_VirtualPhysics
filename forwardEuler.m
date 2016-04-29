function [t_vec,x] = forwardEuler(A,x0,t_start,t_end,h )
%FORWARDEULER returns time vector (for plotting) and state variable based
%on the forward euler
%   Detailed explanation goes here


i = 1;
x = zeros(size(t_start:h:t_end));
x(i) = x0;

%Calculation of the forward euler like:02_BasicsAndEulerSolver.pdf:slide 32
for t = t_start:h:t_end
    %FE
    dx_dt(i) = A*x(i);
    x(i+1) = x(i) + dx_dt(i)*h;
    
    
    % for plotting
    t_vec(i) = t;
    i = i+1;
end


end

