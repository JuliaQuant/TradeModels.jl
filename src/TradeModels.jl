using TimeSeries, Datetime, MarketTechnicals, FinancialSeries, StatsBase

module TradeModels

using TimeSeries, Datetime, MarketTechnicals, FinancialSeries, StatsBase

export AR, arima,
       findall, tinv,
       MarketSignal, discretesignal

################## include files #####################

include("arima.jl")
include("signal.jl")
include("utilities.jl")
include("plot.jl")


end  #of module
