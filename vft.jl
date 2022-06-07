using CSV, DataFrames, LsqFit,PyPlot

rcParams = PyPlot.PyDict(PyPlot.matplotlib."rcParams")
rcParams["font.size"] = 15
rcParams["lines.linewidth"] =  3 
rcParams["lines.markersize"] =12
rcParams["font.family"] =  "TeX Gyre Heros"
rcParams["font.size"] =  30
rcParams["mathtext.fontset"] =  "cm"
rcParams["axes.facecolor"] = "None"
rcParams["axes.linewidth"]= 3
rcParams["axes.unicode_minus"]= "True"
rcParams["xtick.top"]= "True"
rcParams["xtick.major.size"]  = 9.388    
rcParams["xtick.minor.size"] =  5      
rcParams["xtick.major.width"] =  3     
rcParams["xtick.minor.width"] =  3     
rcParams["xtick.major.pad"] = 10


tau_alpha = CSV.read("PS_2_tau_alpha.csv",DataFrame);

vft(T,p) = p[1].+ (log10(exp(1)).*p[2].*p[3]./(T.-p[3]));
p0 = [-10.,5,100.];

logged = [log10(x) for x in tau_alpha[:,2]];

fit = curve_fit(vft,tau_alpha[:,1],logged,p0);

param =fit.param;

y_fit = vft(tau_alpha[:,1],param);
y_fit = [10^x for x in y_fit];


close("all")
semilogy([1000/x for x in tau_alpha[:,1]],tau_alpha[:,2],"ro")
semilogy([1000/x for x in tau_alpha[:,1]],y_fit,"k-")

display(gcf())


