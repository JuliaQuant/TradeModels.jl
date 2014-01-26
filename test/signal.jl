using FactCheck, MarketData
   
fact("signal") do
  context("foo") do
    @fact foo(cl) => 1.11
  end
end
