function theo_acf(phi)
    foo    = zeros(15)
    foo[1] = 1
        for  k in 2:15
           foo[k] = phi ^ k
        end
    plot(x=0:14, y = foo, Geom.line)
end

function theo_ar_process(phi)
    res    = zeros(100)
    res[1] = 0
    for i in 2:100
        res[i] = phi * res[i-1] + randn()
    end
    plot(x=1:100, y = res, Geom.line)
end

