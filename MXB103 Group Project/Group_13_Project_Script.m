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
n = 60;

%% Initiate C and K
C = c/m;
K = k/m;

%% Run Euler function
[t, y, v, h] = euler_bungee(T, n, g, C, K, L)

%% Initiate variables for Taylor2 function
f = @(v, t) g - C*abs(v(end))*v(end) - max(0, K*(y(end) - L));
fdash = @(v, t) diff(g - C*abs(v(end))*v(end) - max(0, K*(y(end) - L)));
a = 0;
b = T;
alpha = y(a+1);

%% Run Second Order Taylor Function
[t_modeuler, w_modeuler, h_moduler] = modeuler_bungee(f, a, b, alpha, n)

%% Plot modeuler function to display jump

figure();
plot(t_modeuler, w_modeuler);
title('f(t,w) of modeuler function for Jump')
xlabel('Time (t)')
ylabel('Position in relation to Jump (w)')