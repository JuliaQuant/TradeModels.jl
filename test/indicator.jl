using Base.Test
using TradeModels

let

  # global objects for tests
  spx      = readtime(Pkg.dir("TimeSeries/test/data/spx.csv"))

  sma20     = Indicator(sma, [(20)])
  bb5013    = Indicator(bollinger_bands, [(50, 1.3)])
  sma_test  = sma20.method(spx["Close"], sma20.params[1][1])
  bb_test   = bb5013.method(spx, "Close", bb5013.params[1][1], bb5013.params[1][2])

  # assertions
  @test_approx_eq 99.522 s[end]
                                      
end
