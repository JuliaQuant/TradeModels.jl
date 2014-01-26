using FactCheck, MarketData
   
fact("indicator") do
  context("foo") do
    @fact foo(cl) => 1.11
  end
end
