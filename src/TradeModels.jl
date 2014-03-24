using TimeSeries, MarketTechnicals

module TradeModels

using TimeSeries, MarketTechnicals

export tradesignal, 
       annualizedreturn,
       equity,
       discretesignal,
#        previoustradeday,
#        continuereturns,
#        nothinghappenedreturn, 
#        printtoprint
       nextlogreturn,
       nlr,
       previoustradeday,
       continuereturns,
       nothinghappenedreturn, 
       printtoprint

################## include files #####################

include("analysis.jl")
# include("indicator.jl")
# include("rule.jl")
include("signal.jl")
# include("strategy.jl")
# include("tasks.jl")
include("utilities.jl")

end  #of module
