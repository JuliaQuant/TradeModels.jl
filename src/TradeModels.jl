using  DataFrames, DataArrays, Datetime, TimeSeries, MarketTechnicals

module TradeModels

using  DataFrames, DataArrays, Datetime, TimeSeries, MarketTechnicals

export Strategy, 
## testing
       @trademodels

################## include files #####################

include("strategy.jl")
include("indicator.jl")
include("signal.jl")
include("rule.jl")
include("testtrademodels.jl")

end  #of module
