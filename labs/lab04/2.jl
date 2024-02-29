using DifferentialEquations

function first(du, u, p, t)
    a = p[1]
    b = p[2]

    du[1] = u[2]
    du[2] = -a*du[1] - b*u[1] 
end

const x = 0
const y = -2
u0 = [x, y]

p = (4, 8)
tspan = (0.0, 55.0)
prob = ODEProblem(first, u0, tspan, p)
sol = solve(prob)

using Plots; gr()

plot(sol)
savefig("2_1.png")

plot(sol, vars=(2,1))
savefig("2_2.png")