function [ F,dF,xi1 ] = newtonIteration( x,h,fun,xi )
%NEWTONITERATION Summary of this function goes here
%   Detailed explanation goes here

F = double(x+h*fun(xi)-xi);
df = vpa(diff(fun));
dF = double(h*df(xi)-1);
xi1 = xi-F/dF;

end

