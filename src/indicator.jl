type Indicator
  #df::DataFrame # DataSeries typed to time
  colname::String 
  method::Function
  params
#  Indicator(df, da, f, p) = new(df, da, f,p)
  Indicator(col, f, p) = new(col, f,p)
end
