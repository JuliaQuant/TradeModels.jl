using Series, Datetime, MarketTechnicals

module TradeModels

using Series, Datetime, MarketTechnicals

export tradesignal, 
       annualizedreturn,
       equity

################## include files #####################

include("analysis.jl")
include("indicator.jl")
include("rule.jl")
include("signal.jl")
include("strategy.jl")

end  #of module
