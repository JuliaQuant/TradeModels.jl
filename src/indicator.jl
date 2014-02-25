# methods for indicator

type TradeSignal

    series::Array{SeriesPair,1}
    indicator::Function
    relationship::Function
    otherseries::Array{SeriesPair,1}
    whentrue::Array{Date{ISOCalendar}, 1}
  
    TradeSignal() = (x=new(); x.whentrue = istrue(magic))
                          

#SelfReferential() = (x = new(); x.obj = x)
end

