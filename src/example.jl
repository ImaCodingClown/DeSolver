using Plots; pyplot()
using DeSolver
using LaTeXStrings

function test(u,t)
    du=sin(t)^2*u
    return du
end

function testexact(x) 
    # exact solution of test with the initial condition u=1
    return exp(1/2*(x - sin(x)*cos(x)))
end


function wave(u,t)
    du= u[2]
    ddu = -u[1]
    return [du, ddu]
end

soltest4=odesolve(test, 1., (0.,10.), 1, method="RK4")
soltest2=odesolve(test, 1., (0.,10.), 1, method="RK2")
soltest5=odesolve(test, 1., (0.,10.), 0.25, method="RK4")

solwave4=odesolve(wave, [1., 0.], (0.,10.), 1, method="RK4")
solwave2=odesolve(wave, [1., 0.], (0.,10.), 1, method="RK2")
solwave5=odesolve(wave, [1., 0.], (0.,10.), 0.25, method="RK4")


display(plot(map(x->x[1],soltest4.t),map(x->x[1],soltest4.u), label=L"u'=sin(t)^2u"*"  with RK4 stepsize 1"))
display(plot!(map(x->x[1],soltest2.t),map(x->x[1],soltest2.u), label=L"u'=sin(t)^2u"*"  with RK2 stepsize 1"))
display(plot!(map(x->x[1],soltest5.t),map(x->x[1],soltest5.u), label=L"u'=sin(t)^2u"*"  with RK4 stepsize .25"))
display(plot!(testexact, label="Exact Solution of  "*L"u'=sin(t)^2u"))

display(plot(map(x->x[1],solwave4.t),map(x->x[1],solwave4.u), label=L"u''=-u"*"  with RK4 stepsize 1"))
display(plot!(map(x->x[1],solwave2.t),map(x->x[1],solwave2.u), label=L"u''=-u"*"  with RK2 stepsize 1"))
display(plot!(map(x->x[1],solwave5.t),map(x->x[1],solwave5.u), label=L"u''=-u"*"  with RK4 stepsize .25"))
display(plot!(cos, label = "Exact solution of  "*L"u''=-u"))

# gui()
# plot(p1)
# plot!(p4)
