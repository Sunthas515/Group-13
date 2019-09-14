%Group-13 Project Script

%Initiate values for Euler Method
H = 74;
D = 31;
c = 0.9;
m = 80;
L = 25;
k = 90;
g = 9.8;
T = 60;
n = 10;

%Initiate C and K
C = c/m;
K = k/m;

%Run Euler function
[t, y, v, h] = euler_bungee(T, n, g, C, K, L)

%Initiate variables for Taylor2 function
f = @(v, y) g - C*abs(v(end))*v(end) - max(0, K*(y(end) - L));
fdash = diff(g - C*abs(v(end))*v(end) - max(0, K*(y(end) - L)));
a = 0;
b = T;
alpha = y(a+1);
%Run Second Order Taylor Function
taylor2 = bungee_taylor2(f, fdash, a, b, alpha, n)