function i = first_in_tol(array,find,tol)
    % Finds the index of the first value that is within the tolerance range
    % that matches the find value.
    % If tolerance is zero the function will only return indexes where find
    % and array(i) match
    % Returns NaN if index was not found
    for i=1:length(array)
        if array(i) >= find-tol && array(i) <= find+tol
            break;
        end
    end
    if array(i) >= find-tol && array(i) <= find+tol
        
    else
        i = NaN;
    end
end