using Test

include("span.jl")

# Tests adapted from `problem-specifications//canonical-data.json` @ v1.2.0


println("\n"^2, "-"^60, "\n"^3)

@testset "Ten positive two-digit integers" begin
    arr = [rand(10:99)    for i = 1:10]
    @test are_min_and_max(span(arr), arr)
end
println()

@testset "Ten negative two-digit integers." begin
    arr = [rand(-99:-10) for i = 1:10]
    @test are_min_and_max(span(arr), arr)
end
println()

@testset "Five negative and five positive two-digit integers." begin
    [i % 2 == 0  ?  rand(-99:-10)  :  rand(10:99)    for i = 1:10]
    @test are_min_and_max(span(arr), arr)
end
println()

@testset "A thousand integers." begin
    arr = [rand(-10^15 : 10^15)    for i = 1:1000]
    @test are_min_and_max(span(arr), arr)
end
println()

@testset "A thousand Floats." begin
    arr = [10^15 * (rand() - 0.5)   for i = 1:1000]
    @test are_min_and_max(span(arr), arr)
end
println()


# Utility function
function are_min_and_max(tup::Tuple, arr::Array{Any,1})
    for item in arr
        if tup[1] > item  ||  tup[2] < item
            return false
        end
    end

    true
end
