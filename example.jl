function span(a::Array{Any,1})
    lo = hi = first(a)
    for i = 2 : length(a)
        if     a[i] < lo;    lo = a[i]
        elseif a[i] > hi;    hi = a[i]
        end
    end

    lo, hi # returned
end
 
