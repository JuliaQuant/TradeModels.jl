using  DataFrames, DataArrays, Datetime, TimeSeries, MarketTechnicals

module TradeModels

using  DataFrames, DataArrays, Datetime, TimeSeries, MarketTechnicals

export Indicator,
       Signal,
       Rule,
       Strategy,

## testing
       @trademodels

################## include files #####################

include("trademodel.jl")
include("strategy.jl")
include("indicator.jl")
include("signal.jl")
include("rule.jl")
include("../test/testmacro.jl")

end  #of module
