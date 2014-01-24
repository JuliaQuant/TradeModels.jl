# methods for Signal

# relationship between two SA || one SA and a value

function tradesignal{T<:Date{ISOCalendar}, V}(sa1::Array{SeriesPair{T,V},1}, sa2::Array{SeriesPair{T,V},1}, op::Function)
  index(istrue(op(sa1, sa2)))
end  

function tradesignal{T<:Date{ISOCalendar}, V}(sa::Array{SeriesPair{T,V},1}, val::Union(Float64, Int), op::Function)
  idx = index(sa) 
  val = op(value(sa), val)
  index(istrue(SeriesArray(idx, val)))
end  
