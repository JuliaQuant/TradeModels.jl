using Series, Datetime, MarketTechnicals

module TradeModels

using Series, Datetime, MarketTechnicals

export tradesignal

################## include files #####################

include("analysis.jl")
include("strategy.jl")
include("indicator.jl")
include("signal.jl")
include("rule.jl")

end  #of module
