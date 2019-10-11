function [acceleration] = TTA(velocity,time,N)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    acceleration = zeros(1, N-1);
    for n = 1:N-1
        acceleration(n) = (velocity(n+1)-velocity(n))/(time(n+1)-time(n));
    end
end

