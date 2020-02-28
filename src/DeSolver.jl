module DeSolver

#Dependencies
using Plots; gr()

include("functions.jl")
include("odemethods.jl")

export odesolve
export RK4
end # module
