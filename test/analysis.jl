using FactCheck, MarketData
   
fact("analysis") do
  context("foo") do
    @fact foo(cl) => 1.11
  end
end
