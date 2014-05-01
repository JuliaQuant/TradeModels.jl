using TimeSeries, Datetime, MarketTechnicals, FinancialBlotter

module TradeModels

using TimeSeries, Datetime, MarketTechnicals, FinancialBlotter

export MarketSignal,
       annualizedreturn,
       equity,
       discretesignal,
       nextlogreturn, nlr
       nextlogreturn,
       nlr,
       previoustradeday,
       continuereturns,
       nothinghappenedreturn, 
       printtoprint, 
       # from FinancialBlotter
       OrderBook, Trade, tradearray,
       orderbookcolnames, 
       orderbookbidvalues,
       orderbookoffervalues,
       orderbooksellvalues,
       orderbookcovervalues,
       orderbookticker,
       fillorderbook

################## include files #####################

include("analysis.jl")
include("orderbook.jl")
include("trades.jl")
include("analysis.jl")
# include("indicator.jl")
# include("rule.jl")
include("signal.jl")
# include("strategy.jl")
# include("tasks.jl")
include("utilities.jl")

end  #of module
