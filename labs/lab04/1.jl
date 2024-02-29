using DifferentialEquations

function first(du, u, p, t)
    a = p[1]
    du[1] = u[2]
    du[2] = -a*u[1]
end

const x = 0
const y = -2
u0 = [x, y]

p = (4)
tspan = (0.0, 55.0)
prob = ODEProblem(first, u0, tspan, p)
sol = solve(prob, dtmax = 0.05)

using Plots; gr()

plot(sol)
savefig("1_1.png")

plot(sol, vars=(2,1))
savefig("1_2.png")