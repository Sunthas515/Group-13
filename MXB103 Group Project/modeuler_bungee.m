function [t, y, v, h] = modeuler_bungee(T, n, g, C, K, L)
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
k1 = v(j);
k2 = v(j+1);
y(j+1) = y(j) + h/2 * (k1 + k2);
k3 = (g - C*abs(v(j))*v(j) - max(0, K*(y(j) - L)));
k4 = (g - C*abs(v(j+1))*v(j+1) - max(0, K*(y(j+1) - L)));
v(j+1) = v(j) + h/2 * (k3 + k4);
end
% for j = 1:n 
%     k1 = h*f(t(j), w(j)); 
%     k2 = h*f(t(j) + h, w(j) + k1); 
%     w(j+1) = w(j) + 1/2 * (k1 + k2);
% end
% for j = 1:n
%     w(j+1) = w(j) + h*f(t(j),w(j));
% end
% for j = 1:n
%     y(j+1) = y(j) + h*v(j);
%     v(j+1) = v(j) + h*(g - C*abs(v(j))*v(j) - max(0, K*(y(j) - L)));
% end
% for j = 1:n
% k1 = h*v(j);
% k2 = h*f(t(j) + h, y(j) + k1);
% y(j+1) = y(j) + 1/2 * (k1 + k2);
% k3 = h*(g - C*abs(v(j))*v(j) - max(0, K*(y(j) - L)));
% k4 = h*f(t(j) + h, v(j) + k3);
% v(j+1) = v(j) + 1/2 * (k3 + k4);
% end