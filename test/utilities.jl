using FactCheck, MarketData
   
facts("utilities") do

  context("previoustradeday") do
    @fact previoustradeday(cl, secondday)  => firstday
  end

end
