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
[t_euler, y_euler, v_euler, h_euler] = euler_bungee(T, n, g, C, K, L);

%% Run Modified Euler Function
f = @(t,y,v) g - C*abs(v).*v - max(0, K.*(y - L));
[t_modeuler, y_modeuler, v_modeuler, h_modeuler] = modeuler_bungee(T, n, g, C, K, L, f);

%% Plot modeuler function to display jump
figure(1)
plot(t_modeuler, y_modeuler)
title('f(t,w) of modeuler function for Jump')
xlabel('Time (t)')
ylabel('Position in relation to Jump (w)')

hold on
%% Plot euler function to check modeuler
plot(t_euler, y_euler)
legend('modeuler', 'euler');
hold off
%% Plot velocity of modeuler function
figure(2)
plot(t_modeuler,v_modeuler)
hold on
%% Plot velocity of euler function
plot(t_euler,v_euler)
hold off