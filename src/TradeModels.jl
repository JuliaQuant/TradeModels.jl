using TimeSeries, MarketTechnicals, FinancialBlotter

module TradeModels

using TimeSeries, MarketTechnicals, FinancialBlotter

export annualizedreturn,
       equity,
       discretesignal,
       nextlogreturn, nlr

################## include files #####################

include("analysis.jl")
# include("indicator.jl")
# include("rule.jl")
include("signal.jl")
# include("strategy.jl")
# include("tasks.jl")
include("utilities.jl")

end  #of module
