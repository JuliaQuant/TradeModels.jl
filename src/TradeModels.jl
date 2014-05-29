using TimeSeries, Datetime, MarketTechnicals, FinancialSeries, StatsBase

module TradeModels

using TimeSeries, Datetime, MarketTechnicals, FinancialSeries, StatsBase

export MarketSignal, discretesignal

################## include files #####################

include("arima.jl")
include("signal.jl")
include("plot.jl")

end  #of module
