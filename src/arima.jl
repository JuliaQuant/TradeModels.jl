import Base: show

type AR{T<:Float64}
    target::Vector{T}
    features::Matrix{T}   # design matrix
    params::Vector{T}
    errors::Vector{T}
    se::Vector{T}         # standard errors
end

function show(io::IO, arm::AR)
    tstats = arm.params ./ arm.se
    df     = size(arm.features,1) - size(arm.features,2) # rows (or n) - columns (or p+1)
    pt     = cdf(TDist(df), tstats)
    cpt    = 100 * ccdf(TDist(df), tstats)
#     println(io, @sprintf("coefficients:             %.4f  %.4f  %.4f", arm.params[1], arm.params[2], arm.params[3]))
#     println(io, @sprintf("standard errors:          %.4f  %.4f  %.4f", arm.se[1], arm.se[2], arm.se[3]))
#     println(io, @sprintf("t values:                 %.4f  %.4f  %.4f", tstats[1], tstats[2], tstats[3]))
#     println(io, @sprintf("P(>|t|):                  %.4f  %.4f  %.4f", pt[1], pt[2], pt[3]))
    println(io, "Meaningful coefficients:") 
    cpt[1]  > 95 ?  println(io, @sprintf("Intercept:  %.1f", cpt[1]))  : nothing 
    cpt[2]  > 95 ?  println(io, @sprintf("Phi 1:      %.1f", cpt[2]))  : nothing
    cpt[3]  > 95 ?  println(io, @sprintf("Phi 2:      %.1f", cpt[3]))  : nothing
    cpt[4]  > 95 ?  println(io, @sprintf("Phi 3:      %.1f", cpt[4]))  : nothing
    cpt[5]  > 95 ?  println(io, @sprintf("Phi 4:      %.1f", cpt[5]))  : nothing
    cpt[6]  > 95 ?  println(io, @sprintf("Phi 5:      %.1f", cpt[6]))  : nothing
    cpt[7]  > 95 ?  println(io, @sprintf("Phi 6:      %.1f", cpt[7]))  : nothing
    cpt[8]  > 95 ?  println(io, @sprintf("Phi 7:      %.1f", cpt[8]))  : nothing
    cpt[9]  > 95 ?  println(io, @sprintf("Phi 8:      %.1f", cpt[9]))  : nothing
    cpt[10] > 95 ? println(io, @sprintf("Phi 9:      %.1f", cpt[10]))  : nothing
    cpt[11] > 95 ? println(io, @sprintf("Phi 10:     %.1f", cpt[11]))  : nothing

    println(io, "")
end

#function ar(v::Vector{Float64}, p::Int)
function ar(ta::TimeArray{Float64,1}, p::Int)

# p = 10
# ta = c["Settle"]

    pc = percentchange(ta, method="log")
    v  = flipud(pc.values)
    Xs = ones(length(v)-p, p+1)
    for i in 1:length(v)-p
        Xs[i,2:end] = flipud(v[i:i+p-1])'
    end
    y = v[p+1:end]

    # sigs = findall(abs(StatsBase.autocor(v)) .> .05) # find rows that pass .05 confidence
    # sig  = sigs[sigs.<11] # don't care about lags more than 10

    sig = 1:p+1 #canonical method to include all features up to and including the last one that shows serial correlation

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

ar(ta::TimeArray{Float64,1}) = ar(ta,10)
