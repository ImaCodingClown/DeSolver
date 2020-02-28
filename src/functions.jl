#= given some ode model
function(u, t)
    du[1] = diffeq
    du[2] = diffeq 
    ...
return du
=#
include("odemethods.jl")

function odesolve(odefunction::Function, ic, tspan,  stepsize=1e-5; method="RK4")
    h = stepsize
    ts = collect(tspan[1]:h:tspan[2])
    t0= tspan[1]
    u0 = ic
    if method=="RK4"
        sol = [u0]
        tsol = [t0]
        for i in 1:round((tspan[2]-tspan[1])/h)
            u1 = RK4(odefunction, u0, h, t0)
            push!(sol, u1)
            push!(tsol, t0+h)
            u0 = u1
            t0 = t0+h
        end
        # plot(ts,sol)
        return (u=sol, t=tsol)
    else
        println("undefined method")
    end
end
