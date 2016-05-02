function [ y,t_vec ] = AB3( A, b, c, d, u, h, t_end, x0 )
%AB3 Summary of this function goes here
%   Detailed explanation goes here

aSv = length(A);                  	% amount of state vatiables
vectorLength = length(0:h:t_end);	% length of vecotr
i = 1;                              % counting variable

x = zeros(aSv,vectorLength);        % fill a vector with zeros
x(:,i) = x0;                        % replace first element of x vector

y = zeros(size(c,1),vectorLength);  % fill a matix with zeros
y(:,i)=c*x(:,i)+d*u;
t_vec(i)=0;

%Forward Euler to find x1=x(2).
x(:,i+1) = x(:,i) + (A*x(:,i)+b*u)*h;
y(:,i+1)=c*x(:,i+1)+d*u;
i=i+1;
t_vec(i)=(i-1)*h;

%Forward Euler to find x2=x(3).
x(:,i+1) = x(:,i) + (A*x(:,i)+b*u)*h;
y(:,i+1)=c*x(:,i+1)+d*u;
i=i+1;
t_vec(i)=(i-1)*h;

for t = i*h:h:t_end
    %AB3
    
    fk = A * x(:,i)+b*u;
    fk1 = A * x(:,i-1)+b*u;
    fk2 = A * x(:,i-2)+b*u;

    x(:,i+1) = x(:,i) + h/12 * (23*fk-16*fk1+5*fk2);
    y(:,i+1) = c*x(:,i+1)+d*u;
    % for plotting
    t_vec(i+1) = t;
    i = i+1;
end
%y = y(:,1:length(y)-1);
%t_vec = t_vec(1,1:length(t_vec)-2);
%t_vec = t_vec(1,3:length(t_vec));
end

