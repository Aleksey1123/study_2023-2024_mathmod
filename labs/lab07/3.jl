using DifferentialEquations
using Plots

N = 885
n0 = 3

function f(du, u, p, t)
    (n) = u
    du[1] = (0.5 * t + 0.3 * t * u[1]) * (N - u[1])
end

v0 = [n0]
tspan = (0.0, 0.1)
prob =ODEProblem(f, v0, tspan)
sol = solve(prob, dtmax = 0.05)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt = plot(dpi=600,legend=false)
plot!(plt, T, n, color=:blue)
savefig(plt, "3.png")