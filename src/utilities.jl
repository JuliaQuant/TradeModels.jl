function nextlogreturn{T}(ta::TimeArray{T,1})
    lead(percentchange(ta, method="log"))
end

nlr(ta) = nextlogreturn(ta)
