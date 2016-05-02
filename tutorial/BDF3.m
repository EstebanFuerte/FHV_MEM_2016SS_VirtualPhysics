function [x,t_vec] = BDF3(A, b, c, d, u, h, t_end, x0 )
% BDF3 creates a Newton-Gregory-Polynomial
% formulate it for x(t) at t_k+1

i = 1;
x = zeros(size(0:h:t_end));

x(i) = x0;
x(i+1) = (1-A*h)^-1 * x(i) + b*u;
x(i+2) = (1-A*h)^-1 * x(i+1) + b*u;

%Calculation of BDF3
for t = 0:h:t_end;
    %BDF3
    
    %x(i+3) = ((1-(6/11)*h*A)^-1) * ((18/11)*x(i+2) - (9/11)*x(i+1) + (2/11)*x(i));
    
    x(i+3) = ((1-(6/11)*h*A)^-1) * ((18/11)*x(i+2) - (9/11)*x(i+1) + (2/11)*x(i) + ((6/11)*h*b*u));
    
    %for plotting
    t_vec(i) = t;
    i = i+1;
end

x=x(:,1:length(x)-3);