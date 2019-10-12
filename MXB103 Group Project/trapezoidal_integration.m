function integral = trapezoidal_integration(f,h)
% Takes in a function and returns the integral of it given that
% f = f(x)
% n = number of subintervals (in this case seconds)
% f(0) = a
% f(end) = b
% h = (b-a)/n;
% x = a:h:b;
n = length(f);
sum = 0;

% Sum middle terms
for i = 2:n
    sum = sum + f(i);
end

% Calculate final definite integral
% h = (f(n) - f(1))/n;
integral = h/2 * (f(1) + 2*sum + f(n));
end