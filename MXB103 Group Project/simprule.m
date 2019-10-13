function I = simprule(f,a,b,n)
% SIMPRULE Simpson's rule integration.
% I = SIMPRULE(F,A,B,N) returns Simpson's rule approximation for the
% integral of f(x) from x=A to x=B, using N subintervals where F is a
% function handle.
SumA = 0;
SumB = 0;
h = (b-a)/n;
% Iterate over the terms and ground according to odd and even
for i=1:n/2
    SumA = SumA + f(a+h*(2*i-1));
end
for i=1:n/2-1
    SumB = SumB + f(a+h*(2*i));
end
% Calculate final integration
I = (f(a) + 4*SumA + 2*SumB + f(b)) * h / 3;
end