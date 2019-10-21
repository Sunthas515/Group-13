function [Distance_from_water,L_new,k_new,peaks] = improve_rope_constants(L,k,accuracy,T,n,g,C,m,H)
    Distance_from_water = 100;
    for i = L-L*accuracy/100:L*accuracy/100:L+L*accuracy/100
        for j = k-k*accuracy/100:k*accuracy/100:k+k*accuracy/100
            L_test = i;             % Length of bungee cord (m)
            k_test = j;             % Spring constant of bungee cord (N/m)
            K_test = k_test/m;      % Scaled spring constant
            f = @(t,y,v) g - C*abs(v).*v - max(0, K_test.*(y - L_test));
            [t_modeuler, y_modeuler, v_modeuler, h_modeuler] = modeuler_bungee(T, n, g, C, K_test, L_test, f);
            a_modeuler = first_order_forward(v_modeuler, n, T);
            peaks = findpeaks(y_modeuler);
            New_Distance_from_water = H-peaks(1)-2;
            if min(a_modeuler) > -19.6
                if abs(New_Distance_from_water) < abs(Distance_from_water)
                Distance_from_water = New_Distance_from_water;
                L_new = L_test;
                k_new = k_test;
                end
            end
        end
    end
end