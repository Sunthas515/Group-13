%Group-13 Project Script

%Initiate values for Euler Method
H = 74;
D = 31;
c = 0.9;
m = 80;
L = 25;
k = 90;
g = 9.8;
T = 100;
n = 100;

%Initiate C and K
C = c/m;
K = k/m;

%Run Euler function
[t_euler, y_euler, v_euler, h_euler] = euler_bungee(T, n, g, C, K, L)

%Initiate variables for Taylor2 function
f = @(v, t) g - C*abs(v(end))*v(end) - max(0, K*(y(end) - L));
fdash = @(v, t) diff(g - C*abs(v(end))*v(end) - max(0, K*(y(end) - L)));
a = 0;
b = T;
alpha = y(a+1);
%Run Second Order Taylor Function
[t_taylor, w_taylor, h_taylor] = modeuler_bungee(f, a, b, alpha, n)