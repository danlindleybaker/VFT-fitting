using CSV, DataFrames, LsqFit, Plots
pyplot()

tau_alpha = CSV.read("PS_2_tau_alpha.csv",DataFrame)


vft(T,p) = p[1].+ (log10(exp(1)).*p[2].*p[3]./(T.-p[3]))
p0 = [-10.,5,100.]

logged = [log10(x) for x in tau_alpha[:,2]]

fit = curve_fit(vft,tau_alpha[:,1],logged,p0);

param =fit.param;

y_fit = vft(tau_alpha[:,1],param)
y_fit = [10^x for x in y_fit]

plot([1000/x for x in tau_alpha[:,1]],tau_alpha[:,2],line = :scatter,yaxis=:log,marker = :o)
plot!([1000/x for x in tau_alpha[:,1]],y_fit)