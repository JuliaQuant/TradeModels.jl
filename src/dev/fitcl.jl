using MarketData, TradeModels, Quandl
import Base.show, TimeSeries.findall

include(Pkg.dir("FinancialSeries/src/dev/byvolume.jl"))

#crude = quandl("CHRIS/CME_CL1", rows=1000)
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

# type AR
#     target
#     features   # design matrix
#     params
#     errors
#     se         # standard errors
# end

function Base.show(ar::AR)
#    println(io, @sprintf("%d", 4))
    println(io, "")
end

#function ar(v::Vector{Float64}, p::Int)
function ar(ta::TimeArray{Float64,1}, p::Int)

    pc = percentchange(ta, method="log")
    v  = flipud(pc.values)
    Xs = ones(length(v)-p, p+1)
    for i in 1:length(v)-p
        Xs[i,2:end] = flipud(v[i:i+p-1])'
    end
    y = v[p+1:end]

    sigs = findall(abs(autocor(v)) .> .05) # find rows that pass .05 confidence
    sig  = sigs[sigs.<11] # don't care about lags more than 10

    #sig = 1:p+1 #canonical method to include all features up to and including the last one that shows serial correlation

    X = Xs[:,sig] # the first column remains 1s, some put this as the last
    # Normal Equations
    # ß = inv(X'X)*X'*y 
    # QR Decomposition
    Q,R = qr(X)

    beta    = inv(R)Q'y
    epsilon = y-X*beta
    mse     = mean(epsilon.^2)
    ∑       = mse * inv(X'X)
    stderr  = sqrt(diag(∑)) # diag(sqrtm(∑))

    AR(y,X,beta,epsilon,stderr)
end

#myfit = ar(c["Settle"],6)
