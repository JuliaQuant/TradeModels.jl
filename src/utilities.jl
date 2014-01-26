function tradedays()
  # define steps as each row from an Array{Date{ISOCalendar}}
end

function previoustradeday(ta::Array{Date{ISOCalendar},1}, d::Date{ISOCalendar})
  n = findfirst(ta .== d)
  ta[n-1]
end

function previoustradeday{T,V}(sa::Array{SeriesPair{T,V},1}, d::Date{ISOCalendar})
  n = findfirst(index(sa) .== d)
  sa[n-1].index
end
