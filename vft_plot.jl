using CSV, DataFrames, LsqFit,PyPlot
include("graph_setup.jl")
include("vft_functions.jl")

tau_alpha = CSV.read("PS_2_tau_alpha.csv",DataFrame)

param,sigma = vft_fit(tau_alpha[:,1],tau_alpha[:,2])


y_fit = vft(tau_alpha[:,1],param)
y_fit = [10^x for x in y_fit]

fig,ax = subplots()
close("all")
ax.semilogy([1000/x for x in tau_alpha[:,1]],tau_alpha[:,2],"ro")
ax.semilogy([1000/x for x in tau_alpha[:,1]],y_fit,"k-")
#savefig("test")

display(gcf())
println("works")



