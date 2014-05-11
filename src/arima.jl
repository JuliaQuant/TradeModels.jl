function acf(x::Vector{Float64}, n::Int)
    aa = ones(n)
    for i in 2:length(n)
        aa[i] = cor(x[1:end-(i-1)], x[i:end])
    end
    aa
end


