using FactCheck, MarketData
   
fact("strategy") do
  context("foo") do
    @fact foo(cl) => 1.11
  end
end
