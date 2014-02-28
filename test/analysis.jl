using MarketData
   
facts("analysis") do

  context("annualized returns and equity curve") do
      @fact equity(cl, prices=true)[end] => roughly(1.164702528)
      @fact annualizedreturn(cl)         => 0.07905094554845449
  end

end
