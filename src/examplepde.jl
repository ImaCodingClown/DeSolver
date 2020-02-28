using Plots; pyplot()
using DeSolver
using LinearAlgebra
using LaTeXStrings

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

soltest1=odesolve(f, u0, (0.,10.), 1, method="RK4")
soltest2=odesolve(f, u0, (0.,10.), .1, method="RK4")
soltest3=odesolve(f, u0, (0.,10.), .01, method="RK4")

