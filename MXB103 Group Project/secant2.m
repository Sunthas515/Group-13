function [x,i] = secant2(F,X,T,y,tol,maxiters)
%SECANT Secant method
% [x,i] = secant(f, x0, x1, tol, maxiters) performs the secant
% method with f(x), starting at x_0 = x0 and x_1 = x1, and continuing
% until either |x_i+1 - x_i| <= tol, or maxiters iterations have
% been taken. The number of iterations, i, is also returned.
% An error is raised if the first input is not a function handle.
% A warning is raised if the maximum number of iterations is reached
% without achieving the tolerance.


i = 0;      % initialise counter
f_x = F(2);     % Set first x value (input x1)
f_x_old = F(1); % Set first old x value (input x0)
x = X(2);
x_old = X(1);

% While value is not within the required tolerance (tol) and maximum number of
% iterations (maxiters) has not been reached
while abs(x_old - x) >= tol && i < maxiters
fdash = (f_x-f_x_old)/(x-x_old);  % approximate derivative of function
x_old = x; % record the current x as the old x for the next iteration
x = x-f_x/fdash; % compute the new x
f_x_old = f_x;
f_x = forward_eval(X,T,x)-y;
i = i + 1; % increase counter by one
end
% Warning if maximum number of iterations is reached without achieving
% specified tolerance
if abs(x - x_old) > tol
warning('Maximum number of iterations reached without achieving tolerance.')
end
end