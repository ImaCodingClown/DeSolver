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

![test function](/testfunction.png)

![wave function](/wavefunction.png)
