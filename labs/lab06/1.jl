using DifferentialEquations
using Plots

beta = 0.1

function f(du, u, p, t)
    S, I, R = u
    du[1] = 0
    du[2] = -beta*u[2]
    du[3] = beta*I
end

N = 18000
I0 = 118
R0 = 18
S0 = N - I0 - R0

v0 = [S0, I0, R0]
tspan = (0.0, 60.0)
prob =ODEProblem(f, v0, tspan)
sol = solve(prob, dtmax = 0.1)

S = [u[1] for u in sol.u]
I = [u[2] for u in sol.u]
R = [u[3] for u in sol.u]
T = [t for t in sol.t]

plt1 = plot(dpi=600,legend=:topright)
plot!(plt1, T, S, label = "Восприимчивые особи", color=:blue)
plot!(plt1, T, I, label = "Инфицированные особи", color=:green)
plot!(plt1, T, R, label = "Особи с иммунитетом", color=:red)
savefig(plt1, "1.png")