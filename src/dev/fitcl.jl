using MarketData, TradeModels, Quandl, Distributions
import Base.show, TimeSeries.findall

tinv(df::Int, pval::Float64) = quantile(TDist(df), pval) # t table
tinv(df::Int, pval::FloatRange{Float64}) = quantile(TDist(df), pval) # t table

include(Pkg.dir("FinancialSeries/src/dev/byvolume.jl"))

crude = quandl("CHRIS/CME_CL1", rows=1000)
myvol = 825399
c = byvolume(crude, myvol)

function findall(b::BitArray)
    rownums = zeros(Int, sum(b))
    j = 1
    for i in 1:length(b)
      if b[i]
        rownums[j] = i
        j+=1
      end
    end
    rownums
end

# Phi = phi_0 to phi_p or length of p + 1
# y = all the ys starting at the p index, because we need pre values
# [yp+1 yp+2 ... end]
# the number of rows in y == number of rows in X
# X is a big matrix with the first row of 1s and the number of columns after that equal to p for a total of p+1 columns
# the number of columns in X must match the number of rows in Phi, because that's how it lines up
# to estimate Phi  :
##     inv(X'X) * X' * y 

ret = percentchange(cl, method="log")
ret = flipud(ret.values)

#myfit = ar(c["Settle"],6)
