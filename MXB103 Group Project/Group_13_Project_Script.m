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
[t_euler, y_euler, v_euler, h_euler] = euler_bungee(T, n, g, C, K, L)

%% Run Modified Euler Function
[t_modeuler, y_modeuler, v_modeuler, h_modeuler] = modeuler_bungee(T, n, g, C, K, L)

%% Plot modeuler function to display jump
figure()
plot(t_modeuler, y_modeuler)
title('f(t,w) of modeuler function for Jump')
xlabel('Time (t)')
ylabel('Position in relation to Jump (w)')

hold on;
%% Plot euler function to check modeuler
plot(t_euler, y_euler)
legend('modeuler', 'euler');