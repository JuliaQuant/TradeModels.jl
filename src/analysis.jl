######## annualized return ###################

# returns a single value in simple terms
function annualizedreturn{T}(ta::TimeArray{T,1})
    exp(sum(diff(log(ta.values)))) ^ (252/length(ta)) - 1 
end

function annualizedreturn(fa::Array{Float64, 1})
    exp(sum(diff(log(fa)))) ^ (252/size(fa,1)) - 1 
end

######## equity curve ########################

# returns an array that depicts a curve
function equity{T}(ta::TimeArray{T,1}; prices=false)
    prices ?
    TimeArray(ta.timestamp, [1.0, expm1(cumsum(diff(log(ta.values)))) + 1], ["equity"]) :
    TimeArray(ta.timestamp, [1.0, expm1(cumsum(ta.values)) + 1], ["equity"])
end
