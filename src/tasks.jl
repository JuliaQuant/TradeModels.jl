function printtoprint{T,V}(sa::Array{SeriesPair{T,V},1}, d::Date{ISOCalendar})
  log(sa[previoustradeday(sa, d)].value) - log(sa[d].value)
end

function nothinghappenedreturn{T,V}(sa::Array{SeriesPair{T,V},1}, d::Date{ISOCalendar})
  produce(SeriesPair(d, printtoprint(sa,d)))
end

continuereturns = Task(nothinghappenedreturn)
