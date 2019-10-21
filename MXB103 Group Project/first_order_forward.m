function fdash = first_order_forward(f, n, T)
%FIRST_ORDER_FORWARD First order forward difference approximation to f'.
% FDASH = FIRST_ORDER_FORWARD(F, X0, H) returns (f(X0+H) - f(X0)) / H
% where F is a function handle.

h = T/n;
fdash = zeros(1,length(f)-1);
for i = 1:length(f)-1
fdash(i) = (f(i+1) - f(i))./ h;
end
