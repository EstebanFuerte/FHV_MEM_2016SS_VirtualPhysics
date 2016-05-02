function [ yAB3,t_vec ] = AB3( A, b, c, d, u, h, t_end, x0 )
%AB3 Summary of this function goes here

%   Detailed explanation goes here
t_start=0;
% Artificial Variables
i= 1;
x = zeros(size(t_start:h:t_end));
x(i) = x0;
yAB3(i) = c'*x(i)+d*u;

    

%Forward Euler to find x1=x(2).

x(i+1) = x(i) + (A*x(i)+b*u)*h;
y = x(1) + (A*x(1)+b*u)*h;
yAB3(i+1)=c'*x(i+1)+d*u;
i=i+1;

    
%Forward Euler to find x2=x(3).
x(i+1) = x(i) + (A*x(i)+b*u)*h;
yAB3(i+1)=c'*x(i+1)+d*u;
i=i+1;

    

%Calculation of the backwar euler
for t = t_start:h:t_end
    %AB3
    
    fk = A * x(i);
    fk1 = A * x(i-1);
    fk2 = A * x(i-2);
    
    
    x(i+1) = x(i) + h/12 * (23*fk-16*fk1+5*fk2);
    
    %yFE(i+1)=c'*x(i+1)+d*u(i);
    yAB3(i+1)=c'*x(i+1)+d*u;
    
    % for plotting
    t_vec(i) = t;
    i = i+1;

end
t_vec = t_vec(:,3:length(t_vec));
end

