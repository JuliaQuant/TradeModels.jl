macro long(sa1::Array{SeriesPair,1}, ind::Function, op::Function, val::Union(Int, Float64), foo, sa2::Array{SeriesPair,1})
  
# macro long(sa, ind, op, val, foo, sa2)
  vec     = :($ind($sa))
  sigdays = :($tradesignal($vec, $val, $op))
  oprets  = :($lag($percentchange($sa2), 2))
  trades  = :($oprets[$sigdays])
  :($exp($sum($value($trades))) ^ (252/$length($sa2)) - 1)
end


















############ below is likely rubbish

########## function simulate(s::Strategy, df::DataFrame)
##########   # add indicators to df
########## 
##########   for indy in s.indicator
##########     # df[string(s.method)] = s.method(df, s.colname, s.params)[s.params:end, :]
##########     df[string(s.indicator)] = indy.method(df[indy.colname], indy.params)
##########   end

  # add signal state column

  # do something mysterious to apply the rule

  # do another mysterious thing to transform the previous step
  # into a ledger

  # return ledger object, with summary show method

# end
