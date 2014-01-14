######## annualized return ###################

# returns a single value in simple terms
function annualizedreturn{T,V}(sa::Array{SeriesPair{T,V}, 1}, ndays::Int)
  exp(sum(diff(log(value(sa))))) ^ (252/ndays) - 1 
end

function annualizedreturn{T,V}(sa::Array{SeriesPair{T,V}, 1}; prices=false)
  prices ?
  exp(sum(diff(log(value(sa))))) ^ (252/size(sa,1)) - 1 :
  exp(sum(sa)) - 1
end

######## equity curve ########################

# returns an array that depicts a curve
function equity{T,V}(sa::Array{SeriesPair{T,V}, 1}; prices=false)
  prices ?
  expm1(cumsum(diff(log(value(sa))))) + 1 :
  expm1(cumsum(sa))
end

