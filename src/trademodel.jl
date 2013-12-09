# define types for the package 

module A

export Indicator, Signal, Rule, Strategy

type Indicator
  colname::String 
  method::Function
  params

  Indicator(col, f, p) = new(col, f, p)
end

type Signal
  logic::Array{Expr}
end

# [eval(foo) for foo in s.logic]

type Rule

end

type Strategy{T<:Indicator}
  indicators::Array{T}
  # signals::Array{Signal}
  # rules::Array{Rule}

  #Strategy(x,y,z) = new(x,y,z)
  Strategy(x) = new(x)
end

end #of module
