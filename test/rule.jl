using FactCheck, MarketData
   
fact("rule") do
  context("foo") do
    @fact foo(cl) => 1.11
  end
end
