using MarketData
   
facts("tasks") do

  context("foo") do
    @fact cl.values[1] => 105.22
  end

end
