function [x,t_vec] = RK4(A, b, c, d, u, h, t_end, x0)

i = 1;
x = zeros(size(0:h:t_end)); 
x(i) = x0;
y(i)= c*x(i)+d*u;
t_start=0;

for t = t_start :h: t_end      %Implementation of RK4 according 03_RungeKuttaAndStability/Slide 21 

dx_dt = A*x(i) + b*u;                 %Zustandsraumdarstellung

xP1 = x(i) + h/2 * dx_dt ;
dxP1_dt = A* xP1 + b*u ;

xP2 = x(i) + h/2 * dxP1_dt ;
dxP2_dt = A* xP2 + b*u ;

xP3 = x(i) + h* dxP2_dt ;
dxP3_dt = A* xP3 + b*u ;

x(i +1) = x(i) + (h/6)*(dx_dt + 2* dxP1_dt + 2* dxP2_dt + dxP3_dt );

% for Plotting
t_vec (i) = t;
i = i+1;
end
x = x(:,1:length(x)-1);
end