function [t, w, h] = bungee_taylor2(f, fdash, a, b, alpha, n, y)
%   taylor Euler's method 
% [t, w, h] = bungee_taylor2(f, a, b, alpha, n) performs Euler's method for 
% solving the IVP y' = f(t,y) with initial condition y(a) = alpha 
% taking n steps from t = a to t = b in order to perform numerical analysis
% on bungee jumper.

%% calculate h
h = (b-a)/n;

%% create t array
t = a:h:b;

%% initialise v array
w = zeros(size(t));
w(1) = alpha;

%% perfrom iterations
for j = 1:n
    w(j+1) = w(j) + h*(9.8 - (0.9/80)*abs(w(j))*w(j) - max(0, (90/80)*(y(j) - 25)));
end