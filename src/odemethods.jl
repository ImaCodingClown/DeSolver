function RK4(f, u0, h, t0)
    y0 = u0
    # k0 = f(y0,t0)
    k1 = f(y0,t0)
    k2 = f(y0+h*k1/2,t0+h/2)
    k3 = f(y0+h*k2/2,t0+h/2)
    k4 = f(y0+h*k3,t0+h)
    y1 = y0+(k1+2k2+2k3+k4)*h/6
    return y1
end