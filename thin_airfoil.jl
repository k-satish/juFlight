push!(LOAD_PATH, "/home/satish/juFlight")
include("clear.jl")
clear()
#=Input: Airfoil co-ordinates
Output: CL₀,CMac
Method: Thin airfol theory (Aerodynamics for Engineering students, Houghton.E.L, Carpenter P W, Fifth ed. ,pp-176)
=#
    using NumericalMath
    using CurveFit
    using PyPlot
    d=readdlm("naca2412");#airfoil coordinates 
    x=d[:,1];y=d[:,2];
    n=size(x,1)
    dxi=x[2]-x[1] ;i=1;#splitting data to upper/lower
    if dxi < 0
	while x[i+1]-x[i] < 0 i +=1 end
    else while x[i+1]-x[i] > 0 i +=1 end
    end
    if y[2] > y[n-1]
	xu=x[1:i];yu=y[1:i];
	xl=x[i+1:n];yl=y[i+1:n];
    else
	xl=x[1:i];yl=y[1:i];
        xu=x[i+1:n];yu=y[i+1:n];
    end#splitting the data to upper/lower
    j=1;xc  =zeros( min(size(xu,1),size(xl,1))); yc  =zeros( min(size(xu,1),size(xl,1)));  xyc = [xc yc];# estimate mean line,slope
    while j <= min(size(xu,1),size(xl,1))
    xc[j] = xu[j];
    yc[j] = (yu[j]+interp1d(xl,yl,xc[j]))*.5;
    j +=1;
    end
    dyxc  =zeros( min(size(xu,1),size(xl,1))-1);j=1;
    while j <= min(size(xu,1),size(xl,1))-1
    dyxc[j]=(yc[j+1]-yc[j])/(xc[j+1]-xc[j]);
    j +=1;
    end #estimate mean line,slope
    
    K=poly_fit(xc,yc,8);#generate curve fit, find mean-line slope function
    θ1=linspace(0,π,100);
    XC(θ1)=0.5(1-cos(θ1));
    fit_c(θ1)=K[1]+K[2].* XC(θ1).^1+K[3].* XC(θ1).^2+K[4].* XC(θ1).^3+K[5].* XC(θ1).^4+K[6].* XC(θ1).^5+K[7].* XC(θ1).^6+K[8].* XC(θ1).^7+K[9].* XC(θ1).^8;
dyx_c(θ1)=K[2]+2K[3].* XC(θ1).^1+3K[4].* XC(θ1).^2+4K[5].* XC(θ1).^3+5K[6].* XC(θ1).^4+6K[7].* XC(θ1).^5+7K[8].* XC(θ1).^6+8K[9].* XC(θ1).^7;#generate curve fit, find mean-line slope function

b0=quadgk(dyx_c,0,π)[1]/π; # estimate CL₀,CMac
aa(θ1)=dyx_c(θ1).*cos(θ1);
b1=quadgk(aa,0,π)[1]*2/π;
aa1(θ1)=dyx_c(θ1).*cos(2*θ1);
b2=quadgk(aa1,0,π)[1]*2/π;
π*(b1-2*b0),-π*.25*(b1-b2)# estimate CL₀,CMac

# vim:filetype=julia:foldmethod=syntax

