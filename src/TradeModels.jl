using TimeSeries, Datetime, MarketTechnicals, FinancialBlotter

module TradeModels

using TimeSeries, Datetime, MarketTechnicals, FinancialBlotter

export MarketSignal,
       annualizedreturn,
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
