vft(T,p) = p[1].+ (log10(exp(1)).*p[2].*p[3]./(T.-p[3]))

function vft_fit(T,tau_alpha)

    #vft(T,p) = p[1].+ (log10(exp(1)).*p[2].*p[3]./(T.-p[3]))
    p0 = [-10.,5,100.]

    logged = [log10(x) for x in tau_alpha]

    fit = curve_fit(vft,T,logged,p0)
    sigma = stderror(fit)
    

    return fit.param,sigma
end
