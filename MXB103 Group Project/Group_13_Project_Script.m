%Group-13 Project Script

%% Initiate values for Euler Method
H = 74;
D = 31;
c = 0.9;
m = 80;
L = 25;
k = 90;
g = 9.8;
T = 60;
n = 600;

%% Initiate C and K
C = c/m;
K = k/m;

%% Run Euler function
[t, y, v, h] = euler_bungee(T, n, g, C, K, L);

%% Initiate variables for Taylor2 function
% f = @(v, t) g - C*abs(v(end))*v(end) - max(0, K*(y(end) - L));
% fdash = @(v, t) diff(g - C*abs(v(end))*v(end) - max(0, K*(y(end) - L)));
% a = 0;
% b = T;
% alpha = y(a+1);

%% Run Second Order Taylor Function
[t1, y1, v1, h1] = modeuler_bungee(T, n, g, C, K, L);

%% Plot modeuler function to display jump
figure()
plot(t1, y1)
title('f(t,w) of modeuler function for Jump')
xlabel('Time (t)')
ylabel('Position in relation to Jump (w)')

hold on;
%% Plot euler function
plot(t, y)
legend('modeuler', 'euler');