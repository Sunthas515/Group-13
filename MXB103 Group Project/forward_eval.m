function y = forward_eval(X, T, x)
    %FORWARD_EVAL Evaluate Newtons forward difference form of the
    %interpolating polynomial
    % y = FORWARD_EVAL(X, T, x) returns y = Pn(x), where Pn is the
    % interpolating polynomial constructed using the abscissas X and
    % forward difference table T.
    [m,n] = size(T);
    if m ~= n
        error('T must be square.');
    end
    h = X(2) - X(1);            % initialise h
    s = (x - X(1))/h;
    y = zeros(size(x));         % initialise sum
    for k = 1:n                 % loop over sum index
        P = ones(size(x));      % initialise product
        for i = 1:k-1           % loop over product index
            P = P .* (s-i+1);         % multiply next factor
        end
        y = y + T(k,k) * P / factorial(k-1);     % add next term
    end
end