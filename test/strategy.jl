using Base.Test
using TimeModels

let
################ pull this out into src/strategy.jl


type Strategy

indicator::Array{Function}

signal::DataArray{Int64}

rule::Array{Tuple}

f(s) = x->s(x)

#Strategy() = ( z = new([log_return],DataArray([3,2]), [(1,1)]) ; z.rule = [(string(z.indicator), x -> z(x))])
Strategy() = new()
Strategy(x,y,z) = new(x,y,z)
end

############################################

  # global objects for tests
  s = Strategy()  

  # assertions
  @assert 0 ==  s.indicator
  @assert 0 ==  s.signal
  @assert 0 ==  s.rule
                                      
end
