%% MXB103 Project Group 13:  BUNGEE!

%% 1  Introduction
% As part of Brisbane's "New World City" transformation, the Brisbane City
% Council is investigating a proposal to allow bungee jumping off the
% Story Bridge. This report addresses several key questions about the
% proposal.
%
% In Section 2 of this report, the proposal and the key questions relating 
% to it are discussed in more detail.  In Section 3, the model and its
% equation are discussed in greater detail including where values come 
% as well as outlining assumptions, limitations and the values that shall
% be used in the model (values for a 80kg person). In Section 4, the
% model will be formulated and then solved using the numerical method for a
% second order function. And finally, in Section 5, this report will answer
% several questions regarding the specifics of the model and what will be
% expected during the jump.

%% 2  The proposal
% The proposal calls for a platform to be installed at the very top of the
% bridge, from which the bungee jumps will take place. This platform will
% be at a height H from water level and the model produced will describe
% how y increases as the jumper falls towards the river.
%% The report will answer the following questions:
% # Implement a second order method to solve numerically
% # Plot the jumper's position over time
% # Does the model agree with 10 bounces across 60 seconds?
% # What is the maximum speed and when does it occur?
% # What is the maximum acceleration?
% # Find how far the jumper travels within 60 seconds
% # What delay should the camera at deck height be set to?
% # What properties of the bungee rope could be changed to experience a 'Water Touch'?
%%
% The approach taken for these questions has been outlined in Section 1 and
% will use the model described below.

%% 3 The model
%
% The equation of motion for bungee jumping is
%%
% $$\frac{dv}{dt} = g - C|v|v - \max(0,K(y-L))$$
%
% Write a paragraph or two about the equation, including where it comes
% from and what the symbols mean.

%% 3.1 Assumptions and limitations
%
% Write a paragraph on the assumptions and limitations on the model,
% and a paragraph on the limitations on the study you have conducted.

%% 3.2 Parameters
H = 74;             % Height of jump point (m)
D = 31;             % Deck height (m)
c = 0.9;            % Drag coefficient (kg/m)
m = 80;             % Mass of the jumper (kg)
L = 25;             % Length of bungee cord (m)
k = 90;             % Spring constant of bungee cord (N/m)
g = 9.8;            % Gravitational acceleration (m/s^2)
C = c/m;            % Scaled drag coefficient
K = k/m;            % Scaled spring constant

%% 4 The numerical method
%
% The model itself, is too complicated to solve analytically. So, numerical
% methods will be used to find solutions. Since the model involves two
% (2) unknowns, v and y, a second equation is needed that relates the two
% equations. This relationship is simply that the jumper's velocity (v) is
% the derivative of the jumper's position (y). Hence, for numerical
% purposes, we can think of this problem as two ODEs:
%%
% $$\frac{dy}{dt} = v$$
%%
% $$\frac{dv}{dt} = g - C|v|v - \max(0,K(y-L))$$


%% 4.1 Parameters

T = 60;           % Final time in simulation (s)
n = 600;          % Number of subintervals (you decide how many you need)

%% 4.2 Solution
%
% The ordinary differential equations are solved using Euler's Method.
[t_euler, y_euler, v_euler, h_euler] = euler_bungee(T, n, g, C, K, L);
%%
% The Second Order Differential equations are solved using Modified Euler's
% Method.
f = @(t,y,v) g - C*abs(v).*v - max(0, K.*(y - L));
[t_modeuler, y_modeuler, v_modeuler, h_modeuler] = modeuler_bungee(T, n, g, C, K, L, f);
%%
figure(1)
plot(t_euler, y_euler);
xlabel('Time (s)');
ylabel('Distance fallen (m)');
axis([0 60 0 60]);
title("Figure 1: Euler's Method for Jump position");

figure(2)
plot(t_modeuler, y_modeuler);
xlabel('Time (s)');
ylabel('Distance fallen (m)');
axis([0 60 0 60]);
title("Figure 2: Modified Euler's Method for Jump position");

%% 5 Analysis
%


%% 5.1 Timing and bounces
%
% Looking at Figure 2 we can see that across a period of 60 seconds there 
% are 10 bounces. Thus agreeing with the proposed goal of the experience.

%% 5.2 Maximum speed experienced by the jumper
%
% The "thrill factor" of bungee jumping is atleast partly determined by the
% maximum velocity experienced by the jumper. What is the maximum speed and
% when does it occur?

figure(3)
plot(t_modeuler,v_modeuler)
title('Figure 3: Velocity of modeuler function for jump')
xlabel('Time (s)')
ylabel('Jumper Velocity (m/s)')

%%
% The greatest velocity is 19.99m/s at 2.6 seconds into the jump. In
% relation to the jump, this velocity occurs during the initial jump when 
% the bungie cord reaches its maximum length but hasn't started stretching
% and slowing down the jumper.

%% 5.3 Maximum acceleration experienced by the jumper
%
% Another factor important for thrill-seekers is the maximum acceleration
% experienced. Greater acceleration means bigger thrills but too much might
% kill the customer. Show through mathematical methods what the jumpers
% maximum acceleration is and when it occurs in relation to the whole jump.


a_modeuler = first_order_forward(v_modeuler, n, T);
figure(4)
plot(t_modeuler(1:end-1),a_modeuler)
title('Figure 4: Acceleration of modeuler function for jump')
xlabel('Time (s)')
ylabel('Jumper Acceleration (m/s^2)')
ylim([-20,15])
%%
% The highest absolute acceleration is 18.29 at 4.3s. This is when the
% jumper is coming up from the first bounce in relation to the overall jump.
% The claim of up to 2g is supported by the model since the absolute
% acceleration goes to 18.29 which is approximately 1.87g which falls within
% the claim while also being close enough to 2g for customers to get a
% thrill.

%% 5.4 Distance travelled by the jumper
%
% To compute the distance travelled by the jumper we must find the
% integral. We will use the trapezoidal method to find the definite integral.
%%
% $$\int\limits_{0}^{60}|v|\mathrm{d}t \approx \frac{h}{2}[|v|(0) +
% \sum_{i=1}^{n-1}|v|(i) + |v|(n)]$$
% where
% $$h = \frac{60-0}{n}$$

v_abs = abs(v_modeuler);
distance_travelled = trapezoidal_integration(v_abs,T/n)
%%
% The distance presented above is the total distance travelled between
% time=0s and time=60s for the jumper.

%% 5.5 Automated camera system
%
% The proposal for an installation of an automated camera system has been
% considered in terms of whether it can be set to trigger at a given time.
[Nearest_vals,indexes] = find_vals(y_modeuler,H-D)

T_table = forward_differences(Nearest_vals)

[time_index,i] = secant2(Nearest_vals, indexes, T_table, 43, 0.01, 20)

time = time_index * T / n
%%
% As per the parameters given, for an 80kg jumper. The camera can be
% accurately triggered at a time of 3.43 seconds.

%% 5.6 Water touch option
%
% The bungee company has suggested that a water touch be considered at the
% bottom of the first bounce. In order to do this, the rope's properties
% would need to be altered in order to maintain a rate of 10 bounces in 60
% seconds for an 80kg jumper while not exceeding 2g.

% Assume person can reach down 2 metres to touch water
Distance_from_water = H-max(y_modeuler)-2

accuracies = [50,10,5,1,0.5,0.1];
L_new = L; k_new = k; i = 0;

while(1) %Loop until Distance_from_water_new < 0.1
    
    if L==L_new && k==k_new %iterate through L and k values
        i = i+1;
        accuracy = accuracies(i);
    end
    
    L = L_new; %set values = new values
    k = k_new;
    
    [Distance_from_water_new,L_new,k_new] = improve_rope_constants(L,k,accuracy,T,n,g,C,m,H);
    
    if abs(Distance_from_water_new) < 0.1 
        Distance_from_water_new, L_new, k_new
        break;
    end
    
end

%Create new model with discovered values
K_new = k_new/m;
f = @(t,y,v) g - C*abs(v).*v - max(0, K_new.*(y - L_new));
[t_modeuler_new, y_modeuler_new, v_modeuler_new, h_modeuler_new] = modeuler_bungee(T, n, g, C, K_new, L_new, f);

figure(5);
plot(t_modeuler_new, y_modeuler_new);
xlabel('Time (s)');
ylabel('Distance fallen (m)');
axis([0 60 0 90]);
title("Figure 2: Modified Euler's Method for New Jump position");

a_modeuler_new = first_order_forward(v_modeuler_new, n, T);
figure(6);
plot(t_modeuler_new(1:end-1),a_modeuler_new);
title('Figure 4: Acceleration of modeuler function for jump');
xlabel('Time (s)');
ylabel('Jumper Acceleration (m/s^2)');
ylim([-20,15]);
%%
% In the course of the study, we have found that the length of the rope 
% should be increased from 25m to 41.66m and the spring constant decreased 
% from $90N/m$ to $75N/m$. This produces a jump with approximately 9 bounces in
% 60 seconds while still maintaining an acceleration of less than 2g per
% requirements.
%% 6 Conclusion
%
% To conclude, given the parameters of the jump provided by the company,
% the jump is safe for the public. The proposal of 10 bounces in 60
% seconds is supported by the model as seen in figure 2 of section 4.2. In
% section 5.2 the maximum speed $19.99m/s$ has been found to occur 
% at 2.6 seconds, while the maximum accelleration $18.29m/s^2$ is close
% enough to the proposal's claim of experiencing upto 2g without exceeding it
% and making the jump unsafe. The total distance travelled by the jumper is
% approximately 280.5m and was achieved computing the integral of $|v|dt$
% between 0 and 60 seconds. The study has also found the optimal time
% trigger for the automated camera to be set to is approximately 3.4
% seconds. However, there are a few alterations that need to be made to 
% the model if a water touch is desired. Both the length of the rope and
% the spring constant are insufficient for a safe water touch and it is
% recommended that the length of the rope be increased from 25m to 41.66m
% and the srping constant of the rope be lowered from $90N/m$ to $75N/m$ to
% remain under the safety limit of 2g.





