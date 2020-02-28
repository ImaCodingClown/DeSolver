
include("odemethods.jl")

"""
given some ode model with the initial condition "ic" and the time span "tspan"

```
function ode(u, t)
    du = f(u,t)
    ...
return du 
```
you can solve the ode using
```
sol = odesolve(ode, ic, tspan,  stepsize=1e-5; method="RK4")
```

sol.u will give you the numerical solution to the ode

"""
function odesolve(odefunction::Function, ic, tspan,  stepsize=1e-5; method="RK4")
    h = stepsize
    ts = collect(tspan[1]:h:tspan[2])
    t0= tspan[1]
    u0 = ic

    sol = [u0]
    tsol = [t0]
    if method=="RK4"
        for i in 1:round((tspan[2]-tspan[1])/h)
            u1 = RK4(odefunction, u0, h, t0)
            push!(sol, u1)
            push!(tsol, t0+h)
            u0 = u1
            t0 = t0+h
        end
    elseif method=="RK2"
        for i in 1:round((tspan[2]-tspan[1])/h)
            u1 = RK2(odefunction, u0, h, t0)
            push!(sol, u1)
            push!(tsol, t0+h)
            u0 = u1
            t0 = t0+h
        end
    else
        println("undefined method")
    end
    return (u=sol, t=tsol)
    
end
