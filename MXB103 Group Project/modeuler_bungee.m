function [t, y, v, h] = modeuler_bungee(T, n, g, C, K, L, f)
%euler_bungee Euler's method for the bungee jumping model
% [t, y, v, h] = euler_bungee(T, n, g, C, K, L) performs Euler's method on
% the bungee jumping model, taking n steps from t = 0 to t = T.
% The initial conditions are y(0) = 0 and v(0) = 0.
% The inputs g, C, K and L are parameters from the model (see project description).
% The outputs are the time array t, the solution arrays y and v, and the
% subinterval width h.

% Calculate subinterval width h
h = T / n;

% Create time array t
t = 0:h:T;

% Initialise solution arrays y and v
y = zeros(1,n+1);
v = zeros(1,n+1);

%% perfrom iterations
for j = 1:n
k1 = h*f(t(j),y(j),v(j));
k2 = h*f(t(j)+h,y(j),v(j)+k1);
v(j+1) = v(j) + 1/2*(k1 + k2);
k3 = h*v(j);
k4 = h*v(j+1);
y(j+1) = y(j) + 1/2*(k3 + k4);
end

