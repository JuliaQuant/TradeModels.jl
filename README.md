TradeModels.jl
==============

Modeling the allocation of resources to markets based on the restraints of objective functions


## Installation

````julia
julia> Pkg.clone("https://github.com/JuliaQuant/TradeModels.jl.git")
````

## Proposed Scope

This package will include the full suite of functionality involved in modeling a trade system, 
including financial instrument types, trade blotter, modeling framework and model analysis.

## Proposed API

````julia
julia> using TradeModels

julia> symbols = ["SPY", "QQQ", "IWM"]

julia> stocks = Stock[]

julia> [push!(stocks, Stock(s)) for s in symbols]

julia> trendfollow = Portfolio(stocks)

julia> myfund = Account([trendfollow])

julia> sma10 = Indicator(sma, 10)

julia> sig1 = Signal(close, sma10, :>)

julia> long1 = Rule(:(sig1? 1: 0))

julia> trendisfriend = Strategy([sma10], [sig1], [long1]

julia> simulate(trendisfriend, trendfollow, myfund)

````
