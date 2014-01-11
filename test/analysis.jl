using FactCheck, MarketData
  # df = readtime(Pkg.dir("TimeSeries/test/data/spx.csv"))
  # ec = equity(df["Close"])
   
fact("analysis") do
  context("equity") do
    @fact equity(cl) => 1.11
  end
end
