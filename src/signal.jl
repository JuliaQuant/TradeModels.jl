# methods for Signal

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
