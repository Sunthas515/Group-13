function I = simprule_array(f,h)
% SIMPRULE Simpson's rule integration.
% I = SIMPRULE(F,A,B,N) returns Simpson's rule approximation for the
% integral of f(x) from x=A to x=B, using N subintervals where F is a
% function handle.
SumA = 0;
SumB = 0;
% Iterate over the terms and ground according to odd and even
for i=2:length(f)/2
    SumA = SumA + f(2*i-1);
end
for i=2:length(f)/2-1
    SumB = SumB + f(2*i);
end
% Calculate final integration
I = (f(1) + 4*SumA + 2*SumB + f(end)) * h / 3;
end