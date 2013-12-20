######## equity curve ########################

function equity(dv::DataArray)
  pad([expm1(cumsum(diff(log(dv)))) + 1], 1, 0, 1.0)
end

function equity!(df::DataFrame, col::String)
  new_col = string(string(col), "_equity")
  within!(df, quote
          $new_col  = $equity($df[$col])
          end)
end

function pad(da::DataArray, top::Int, bottom::Int, padwith) #differs from DataArray version in that da is not AbstractDataVector (should it be?)
  [unshift!(da, padwith) for i = 1:top]
  [push!(da, padwith) for i = 1:bottom]
  return da
end
