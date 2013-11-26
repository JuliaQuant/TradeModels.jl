using  DataFrames, DataArrays, Datetime, TimeSeries

module TradeModels

using  DataFrames, DataArrays, Datetime, TimeSeries

export Strategy, 
## testing
       @trademodels

################## include files #####################

include("strategy.jl")
include("testtrademodels.jl")

end  #of module
