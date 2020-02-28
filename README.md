# DeSolver

# Documentation
Load the package by 
```bash
using DeSolver
```
This package solves the givenode model with the initial condition and the time span

## odesolve
With the ode model given in the form of

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



## methods
RK4 = Runge Kutta Method of order 4
RK2 = Runge Kutta Method of order 2

## Examples

### ODEs

Simple first order ODE
```bash
function test(u,t)
    du=sin(t)^2*u
    return du
end

sol=odesolve(test, 1., (0.,10.), 1, method="RK4")
plot(map(x->x[1],sol.t),map(x->x[1],sol.u)
```


![test function](/testfunction.png)

Simple second order ODE
```bash
function trig(u,t)
    du= u[2]
    ddu = -u[1]
    return [du, ddu]
end

sol=odesolve(trig, [1., 0.], (0.,10.), 1, method="RK4")
plot(map(x->x[1],sol.t),map(x->x[1],sol.u)
```
![wave function](/wavefunction.png)

### PDE

```bash
# Number of collocation points 
N = 50
h= pi/N

# create function
function f(u,t)
    du = zeros(length(u))
    for i in 1:length(u)
        if i ==1
            du[1] = (-2u[1] + 2u[2])/h^2
        elseif i == length(u)
            du[length(u)] = (2u[length(u)-1] - 2u[length(u)])/h^2
        else
            du[i] = (u[i-1] - 2u[i] + u[i+1])/h^2
        end
    end
    return du
end

xs=range(0, stop=pi, length=N)
u0=sin.(xs)

sol=odesolve(f, u0, (0.,10.), .1, method="RK4")
 surface(1:10,1:100,(x,y)-> sol.u[y][x], xlabel="x",ylabel="t")
```

![Diffusion Equation 1](/10collocationpoint10timestep.png)

10 Collocation Points, and 10 Timesteps

![Diffusion Equation 2](/10collocationpoint1000timestep.png)

10 Collocation Points, and 1000 Timesteps

![Diffusion Equation 3](/20collocationpoint100timestep.png)

20 Collocation Points, and 100 Timesteps

![Diffusion Equation 4](/50collocationpoint10000timestep.png)

50 Collocation Points, and 10000 Timesteps
