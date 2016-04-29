clear all; close all; clc;

syms x;
fun(x)=-x^3;

eps = 0.01;
count=1;

i = 1;
j=1;

F(i) = 10;
xi1(i) = 5;
xi1_store(1)=10;



for t=0:0.01:0.1
    i=1;
    count = 1;
    
    while abs(F(i))>eps
        [ F(i+1),dF(i+1),xi1(i+1)]=newtonIteration(xi1_store(j),t+0.01,fun,xi1(i));
        count=count+1;
        i=i+1;
    end
    
    t_vect(j) = t;
    xi1_store(j+1) = xi1(i);
    xi1(1) = xi1(i);
    count_2(j) = count;
    j=j+1;
    
end

figure
plot(t_vect,xi1_store(:,1:11));grid on;
