using FactCheck, MarketData
   
facts("rule") do

  context("foo") do
    @fact cl[1].value => 105.22
  end

end
