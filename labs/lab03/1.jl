using DifferentialEquations
using Plots

const army = Float64[50000, 39000]
const length = [0.0, 2.8]

function armyVsArmy(du, u, p, t)
    du[1] = -0.445 * u[1] - 0.806 * u[2] + sin(t + 7) + 1
    du[2] = -0.419 * u[1] - 0.703 * u[2] + cos(t + 4) + 1
end

function armyVsAPartesans(du, u, p, t)
    du[1] = -0.203 * u[1] - 0.705 * u[2] + sin(2 * t)
    du[2] = -0.203 * u[1] - 0.801 * u[2] + 2 * cos(t)
end


prob1 = ODEProblem(armyVsArmy, army, length)
prob2 = ODEProblem(armyVsAPartesans, army, length)

sol1 = solve(prob1)
sol2 = solve(prob2)

army1_1 = [u[1] for u in sol1.u]
army1_2 = [u[2] for u in sol1.u]
time1 = [t for t in sol1.t]

army2_1 = [u[1] for u in sol2.u]
army2_2 = [u[2] for u in sol2.u]
time2 = [t for t in sol2.t]

pltime1 = plot(dpi = 500, legend= true, bg =:white)
plot!(pltime1, xlabel="Время", ylabel="Численность", legend=:outerbottom)
plot!(pltime1, time1, army1_1, label="Армия X", color =:red)
plot!(pltime1, time1, army1_2, label="Армия Y", color =:green)

pltime2 = plot(dpi = 500, legend= true, bg =:white)
plot!(pltime2, xlabel="Время", ylabel="Численность", legend=:outerbottom)
plot!(pltime2, time2, army2_1, label="Армия X", color =:red)
plot!(pltime2, time2, army2_2, label="Армия Y", color =:green)

savefig(pltime1, "1.png")
savefig(pltime2, "2.png")