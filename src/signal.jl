#  point in time observation that has relevance to markets 

import Base: show, getindex

immutable MarketSignal <: AbstractTimeSeries
    timestamp::Vector{Date{ISOCalendar}}
    values::BitArray
    colnames::Vector{ASCIIString}
end

function show(io::IO, ms::MarketSignal)
  # variables 
  nrow          = size(ms.values, 1)
  ncol          = size(ms.values, 2)
  spacetime     = strwidth(string(ms.timestamp[1])) + 3
  firstcolwidth = strwidth(ms.colnames[1])
  colwidth      = Int[]
      for m in 1:ncol
          push!(colwidth, max(strwidth(ms.colnames[m]), 5))
      end

  # summary line
  print(io, @sprintf("%dx%d %s %s to %s", nrow, ncol, typeof(ms), string(ms.timestamp[1]), string(ms.timestamp[nrow])))
  println(io, "")
  println(io, "")

  # row label line
   print(io, ^(" ", spacetime), ms.colnames[1], ^(" ", colwidth[1] + 2 -firstcolwidth))

   for p in 2:length(colwidth)
     print(io, ms.colnames[p], ^(" ", colwidth[p] - strwidth(ms.colnames[p]) + 2))
   end
   println(io,"")
 
  # timestamp and values line
    if nrow > 7
        for i in 1:4
            print(io, ms.timestamp[i], " | ")
        for j in 1:ncol
            print(io, rpad(ms.values[i,j], colwidth[j] + 2, " "))
        end
        println(io, "")
        end
        println(io, '\u22EE')
        for i in nrow-3:nrow
            print(io, ms.timestamp[i], " | ")
        for j in 1:ncol
            print(io, rpad(ms.values[i,j], colwidth[j] + 2, " "))
        end
        println(io, "")
        end
    else
        for i in 1:nrow
            print(io, ms.timestamp[i], " | ")
        for j in 1:ncol
            print(io, rpad(ms.values[i,j], colwidth[j] + 2, " "))
        end
        println(io, "")
        end
    end
end

# convert bool to float and squish a continuous stream to unique, discrete occurances

function discretesignal(ba::TimeArray{Bool,1})
#function discretesignal(ms::MarketSignal)
    iba = float64(ba.values)
    idx = [1]
    for b in 2:length(ba)
        if ba.values[b] !== ba.values[b-1]
            push!(idx, b)
        end
    end
    TimeArray(ba.timestamp[idx], iba[idx], ["signal"])
end
