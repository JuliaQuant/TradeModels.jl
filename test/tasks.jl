using FactCheck, MarketData
   
facts("tasks") do

  context("foo") do
    @fact cl[1].value => 105.22
  end

end
