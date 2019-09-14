function [t, w, h] = bungee_taylor2(f, fdash, a, b, alpha, n)
%   taylor Euler's method 
% [t, w, h] = bungee_taylor2(f, a, b, alpha, n) performs Euler's method for 
% solving the IVP y' = f(t,y) with initial condition y(a) = alpha 
% taking n steps from t = a to t = b in order to perform numerical analysis
% on bungee jumper.

%% calculate h
h = (b-a)/n;

%% create t array
t = a:h:b;

%% initialise w array
w = zeros(size(t));
w(1) = alpha;

%% perfrom iterations
for j = 1:n
    w(j+1) = w(j) + h*(g - C*abs(w(j))*w(j) - max(0, K*(y(j) - L)));
end