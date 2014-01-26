using Series, Datetime, MarketTechnicals

module TradeModels

using Series, Datetime, MarketTechnicals

export tradesignal, 
       annualizedreturn,
       equity,
       previoustradeday,
       continuereturns,
       nothinghappenedreturn, 
       printtoprint

################## include files #####################

include("analysis.jl")
include("indicator.jl")
include("rule.jl")
include("signal.jl")
include("strategy.jl")
include("tasks.jl")
include("utilities.jl")

end  #of module
