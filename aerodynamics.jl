function Cl0(M, P)
    
    M = M/100; P = P/10;
   
    dy_dx1(θ) = 2M*(P-(1-cos(θ))/2)/P^2;
    dy_dx2(θ) = 2M*(P-(1-cos(θ))/2)/(1-P)^2;

    tmp1 = quadgk(dy_dx1, 0, acos(1-2P));
    tmp2 = quadgk(dy_dx2, acos(1-2P), π);
    B0 = (tmp1[1] + tmp2[1])/π;

    dy_dx1a(θ) = 2M*(P-(1-cos(θ))/2)*cos(θ)/P^2;
    dy_dx2a(θ) = 2M*(P-(1-cos(θ))/2)*cos(θ)/(1-P)^2;
    tmp1 = quadgk(dy_dx1a, 0, acos(1-2P));
    tmp2 = quadgk(dy_dx2a, acos(1-2P), π);
    B1 = 2*(tmp1[1] + tmp2[1])/π;
    
    π*(B1-2B0)

end


    #=dy_dx1(x) = 2M*(P-(x/c))/P^2;=#
    #=dy_dx2(x) = 2M*(P-(x/c))/(1-P)^2;=#

    #=tmp1 = quadgk(dy_dx1, 0, P);=#
    #=tmp2 = quadgk(dy_dx2, P, c);=#
    #=B0 = (tmp1[1] + tmp2[1])/π=#

    #=dy_dx1a(x) = 2M*(P-(x/c))*(1-2x/c)/P^2;=#
    #=dy_dx2a(x) = 2M*(P-(x/c))*(1-2x/c)/(1-P)^2;=#
    #=tmp1 = quadgk(dy_dx1a, 0, P);=#
    #=tmp2 = quadgk(dy_dx2a, P, c);=#
    #=B1 = 2*(tmp1[1] + tmp2[1])/π=#

    #=Cl = π*(B1-2B0) + 2π*α;=#

# vim:filetype=julia:foldmethod=syntax


