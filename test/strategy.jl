using MarketData
   
facts("strategy") do

  context("foo") do
    @fact cl.values[1] => 105.22
  end

end
