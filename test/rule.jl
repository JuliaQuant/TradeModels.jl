using  MarketData
   
facts("rule") do

  context("foo") do
    @fact cl.values[1] => 105.22
  end

end
