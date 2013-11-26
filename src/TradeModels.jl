using  DataFrames, DataArrays, Datetime, TimeSeries

module TimeModels

using  DataFrames, DataArrays, Datetime, TimeSeries

export Strategy, 
## testing
       @timemodels

################## include files #####################

include("strategy.jl")
include("testtimemodels.jl")

end  #of module
