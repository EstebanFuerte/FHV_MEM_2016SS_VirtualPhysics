function [y,t_vec] = FE(A, b, c, d, u, h, t_end, x0 )
%FORWARDEULER returns time vector (for plotting) and state variable based
%on the forward euler
%   Detailed explanation goes here


i = 1;
x = [zeros(size(0:h:t_end));zeros(size(0:h:t_end))];
u = 30*ones(size(0:h:t_end));
x(:,i) = x0;
y(i) = c*x(:,i)+d*u(:,i);

%Calculation of the forward euler like:02_BasicsAndEulerSolver.pdf:slide 32
for t = 0:h:t_end
    %FE
    dx_dt(:,i) = A*x(:,i)+b*u(:,i);
    x(:,i+1) = x(:,i) + dx_dt(:,i).*h;
    % for plotting
    t_vec(i) = t;
    y(i+1) = c*x(:,i+1)+d*u(:,i);
    i = i+1;
end
y = y(1,1:length(y)-1);


end

