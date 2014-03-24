# convert bool to int and squish a continuous stream to unique, discrete occurances

function discretesignal(ba::TimeArray{Bool,1})
    iba = int(ba.values)
    idx = [1]
    for b in 2:length(ba)
        if ba.values[b] !== ba.values[b-1]
            push!(idx, b)
        end
    end
    TimeArray(ba.timestamp[idx], iba[idx], ["signal"])
end





# methods for Signal

# relationship between two SA || one SA and a value
# returns an array of dates
#  
#  function tradesignal{T}(ta1::TimeArray{T,1}, ta2::TimeArray{T,1}, op::Function)
#      findwhen(op(ta1, ta2))
#  end  
#  
#  function tradesignal{T}(ta::TimeArray{T,1}, val::Union(Float64, Int), op::Function)
#    idx = index(ta) 
#    val = op(values(ta), val)
#    index(istrue(SeriesTimeArray(idx, val)))
#  end  
