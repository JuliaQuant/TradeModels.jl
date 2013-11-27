type Strategy
  indicators::Array{Indicactor}
  signals::Array{Signals}
  rules::Array{Rules}

  Strategy(x,y,z) = new(x,y,z)

end


function simulate(s::Strategy, df::DataFrame)
  # add indicators to df

  for indy in s.indicator
    df[string(s.indicator)] = indy.method(df[indy.colname], indy.params)
  end

  # add signal state column

  # do something mysterious to apply the rule

  # do another mysterious thing to transform the previous step
  # into a ledger

  # return ledger object, with summary show method

end
