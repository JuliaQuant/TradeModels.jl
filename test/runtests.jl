using Base.Test
using TradeModels

my_tests = ["test/strategy.jl",
           "test/indicator.jl",
           "test/signal.jl",
           "test/rule.jl"]

print_with_color(:cyan, "Running tests: ") 
println("")

for my_test in my_tests
    print_with_color(:magenta, "**   ") 
    print_with_color(:blue, "$my_test") 
    println("")
    include(my_test)
end
