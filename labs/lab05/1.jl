using DifferentialEquations
using Plots

a = 0.24
b = 0.044
c = 0.44
d = 0.024

function func(du, u, p, t)
    x, y = u
    du[1] = -a * u[1] + b * u[1] * u[2]
    du[2] = c * u[2] - d * u[2] * u[1]
end

v0 = [4, 10]
tspan = (0.0, 60.0)

prob = ODEProblem(func, v0, tspan)
sol = solve(prob, dtmax=0.05)

X = [u[1] for u in sol.u]
Y = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt1 = plot(dpi=300,legend=false)
plot!(plt1, X, Y, color=:blue)
savefig(plt1, "1.png")

plt2 = plot(dpi=300,legend=true)
plot!(plt2, T, X, label="Численность жертв", color=:red)
plot!(plt2, T, Y, label="Численность хищников", color=:green)
savefig(plt2, "2.png")

v1 = [c/d, a/b]


prob1 = ODEProblem(func, v1, tspan)
sol1 = solve(prob1, dtmax=0.05)

X1 = [u[1] for u in sol1.u]
Y1 = [u[2] for u in sol1.u]
T1 = [t for t in sol1.t]

plt3 = plot(dpi=300,legend=true)
plot!(plt3, T1, X1, label="Численность жертв", color=:red)
plot!(plt3, T1, Y1, label="Численность хищников", color=:green)
savefig(plt3, "3.png")