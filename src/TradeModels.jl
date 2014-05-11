using TimeSeries, Datetime, MarketTechnicals, FinancialSeries

module TradeModels

using TimeSeries, Datetime, MarketTechnicals, FinancialSeries

export acf,
       MarketSignal, discretesignal

################## include files #####################

include("arima.jl")
include("signal.jl")
include("plot.jl")

end  #of module
