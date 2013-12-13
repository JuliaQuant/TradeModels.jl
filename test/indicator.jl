using Base.Test
using TradeModels

let

  # global objects for tests
  spx   = readtime(Pkg.dir("TimeSeries/test/data/spx.csv"))
  sma20 = Indicator("Close", sma, 20)

  # assertions
  @test 20 == sma20.params
                                      
end
