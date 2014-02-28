# methods for Signal

# relationship between two SA || one SA and a value
# returns an array of dates

function tradesignal{T}(ta1::TimeArray{T,1}, ta2::TimeArray{T,1}, op::Function)
    findwhen(op(ta1, ta2))
end  

function tradesignal{T}(ta::TimeArray{T,1}, val::Union(Float64, Int), op::Function)
  idx = index(ta) 
  val = op(values(ta), val)
  index(istrue(SeriesTimeArray(idx, val)))
end  
