function integration = trapezoidal_integration(f, h)
% Takes in a function and returns the integral of it given that
% f = f(x)
% n = number of subintervals (in this case seconds)
% f(0) = a
% f(end) = b
% h = (b-a)/n
sum = 0;

% Sum middle terms
for i=2:length(f)-1
    sum = sum + f(i);
end

% Calculate final definite integral
integration = h/2 * (f(1) + 2*sum + f(end));
end