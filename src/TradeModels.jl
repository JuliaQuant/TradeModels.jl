module TradeModels

using FinancialBlotter, StatsBase, Reexport
@reexport using FinancialSeries

export AR, arima,
       findall, tinv,
       MarketSignal, discretesignal

################## include files #####################

include("arima.jl")
include("signal.jl")
include("utilities.jl")
include("plot.jl")


end  #of module
