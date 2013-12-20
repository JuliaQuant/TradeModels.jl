module TestAnalysis

using Base.Test
using TimeSeries
using TradeModels

  df = readtime(Pkg.dir("TimeSeries/test/data/spx.csv"))
  ec = equity(df["Close"])
  
  @assert ec[1]    == 1.0
  @assert ec[2]    == 1.004946236559139       #  0.00494623 in R PerformanceAnalytics::Return.cumulative
  @assert ec[507]  == 1.097741935483871       #  0.09774194 in R PerformanceAnalytics::Return.cumulative
end
