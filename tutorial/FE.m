function [y,t_vec] = FE(A, b, c, d, u, h, t_end, x0 )
%FORWARDEULER returns time vector (for plotting) and state variable based
%on the forward euler
%   Detailed explanation goes here

aSv = length(A);                  	% amount of state vatiables
vectorLength = length(0:h:t_end);	% length of vecotr
i = 1;                              % counting variable

x = zeros(aSv,vectorLength);        % fill a vector with zeros
x(:,i) = x0;                        % replace first element of x vector

y = zeros(size(c,1),vectorLength);  % fill a matix with zeros

%Calculation of the forward euler like:02_BasicsAndEulerSolver.pdf:slide 32
for t = 0:h:t_end
    %FE
    dx_dt(:,i) = A*x(:,i)+b*u;
    x(:,i+1) = x(:,i) + dx_dt(:,i)*h;
    
    % for plotting
    t_vec(i) = t;
    y(:,i)=c*x(:,i)+d*u;
    i = i+1;
    
end
%y = c*x+d*u;
%y = y(1,1:length(y)-1);


end

