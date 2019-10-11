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
%figure(1)
%plot(t_modeuler, y_modeuler)
%title('f(t,w) of modeuler function for Jump')
%xlabel('Time (t)')
%ylabel('Position in relation to Jump (w)')

hold on
%% Plot euler function to check modeuler
%plot(t_euler, y_euler)
%legend('modeuler', 'euler');
%hold off
%% Plot velocity of modeuler function
%figure(2)
%plot(t_modeuler,v_modeuler)
%title('Velocity of modeuler and euler function for Jump')
%xlabel('Time (t)')
%ylabel('Velocity of jumper during Jump (w)')
%hold on
%% Plot velocity of euler function
%plot(t_euler,v_euler)
%legend('modeuler', 'euler');
%hold off
%% Q1
figure(1)
plot(t_modeuler, y_modeuler)
title('f(t,w) of modeuler function for jump')
xlabel('Time (t)')
ylabel('Position in relation to jump (w)')
%Looking at the graph of the position of the jumper in relation to the time
%of the jump, there are 10 bounces in a period of 60 seconds. This means 
%that our model agrees with the timing of 10 bounces in 60 seconds.

%% Q2
figure(2)
plot(t_modeuler,v_modeuler)
title('Velocity of modeuler function for jump')
xlabel('Time (t)')
ylabel('Velocity of jumper during jump (w)')

%The greatest velocity is 19.99m/s at 2.6 seconds into the jump. In
%relation to the jump, this velocity occurs during the initial jump when 
%the bungie cord reaches its maximum length but hasn't started stretching
%and slowing down the jumper.

%% Q3
a_modeuler = TTA(v_modeuler, t_modeuler, 601);
t_modeuler2 = t_modeuler;
t_modeuler2(:, 1) = [];
figure(3)
plot(t_modeuler2,a_modeuler)
title('Acceleration of modeuler function for jump')
xlabel('Time (t)')
ylabel('Acceleration of jumper during jump (w)')

%The highest absolute acceleration is 18.29 at 4.3s. This is when the
%jumper is coming up from the first bounce in relation to the overall jump.
%The claim of up to 2g is supported by the model since the absolute
%acceleration goes to 18.29 which is approximately 1.87g which falls within
%the claim while also being close enough to 2g for customers to get a
%thrill.