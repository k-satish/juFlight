workspace()
using PyPlot
push!(LOAD_PATH, "/home/deven/juFlight")
using MyPlot
using FlightPerformance
h=collect(0:100:10000)
myplot(vstall(h),h)
myplot(T∞(h),h)


