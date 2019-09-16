function [t, w, h] = modeuler_bungee(f, a, b, alpha, n)
%Modeuler Modified Euler's method 
% [t, w, h] = modeuler(f, a, b, alpha, n) performs Euler's method for 
% solving the IVP y' = f(t,y) with initial condition y(a) = alpha 
% taking n steps from t = a to t = b.

%% calculate h
h = (b-a)/n

%% create t array
t = a:h:b

%% initialise w array
w = zeros(size(t));
w(1) = alpha

%% perfrom iterations
for j = 1:n 
    k1 = h*f(t(j), w(j)); 
    k2 = h*f(t(j) + h, w(j) + k1); 
    w(j+1) = w(j) + 1/2 * (k1 + k2);
end