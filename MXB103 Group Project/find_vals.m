function [x,indexes] = find_vals(F,x0)
    i = 1;
    while(1)
        if F(i) > x0
            indexes = [i-2,i-1,i,i+1];
            x = F(indexes);          
            break
        else 
            i = i+1;
        end
    end
end