using Plots; plotlyjs()
using DeSolver

function test(u,t)
    du=sin(t)^2*u
    return du
end

function wave(u,t)
    du= u[2]
    ddu = -u[1]
    return [du, ddu]
end

soltest4=odesolve(test, 1., (0.,10.), 1e-1, method="RK4")
soltest2=odesolve(test, 1., (0.,10.), 1e-1, method="RK2")
soltest5=odesolve(test, 1., (0.,10.), 1e-5, method="RK4")

solwave4=odesolve(wave, [1., 0.], (0.,10.), 1e-1, method="RK4")
solwave2=odesolve(wave, [1., 0.], (0.,10.), 1e-1, method="RK2")
solwave5=odesolve(wave, [1., 0.], (0.,10.), 1e-5, method="RK4")

gui()
plot(map(x->x[1],soltest4.t),map(x->x[1],soltest4.u))
plot!(map(x->x[1],soltest2.t),map(x->x[1],soltest2.u))
plot!(map(x->x[1],soltest5.t),map(x->x[1],soltest5.u))

# p4 = plot(map(x->x[1],solwave4.t),map(x->x[1],solwave4.u));
# p5 = plot(map(x->x[1],solwave2.t),map(x->x[1],solwave2.u));
# p6 = plot(map(x->x[1],solwave5.t),map(x->x[1],solwave5.u));

# gui()
# plot(p1)
# plot!(p4)
