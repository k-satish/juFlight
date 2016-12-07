#=@doc doc"""=#
#=Author: Devendra Ghate=#
#=Date:   07-11-2016 Mon 11:29 AM=#
#=Info:   A module containing calculation of a few performance characteristics=#
#=of an aircraft as submitted by MTech-2016 batch.=#
#="""-->=#

__precompile__()

module FlightPerformance

# Gasdynamic and other constants
include("constants.jl") 

# Data conversion utilities
include("utils.jl")   

# Atmospheric model
include("atmmodel.jl")  

# Aerodynamics
include("aerodynamics.jl")  

# Subsonic Jet aircraft data from Hull
include("sbjdata.jl")   

# Basic performance analysis
include("performance.jl") #

#=module Test=#
#=end #module Test=#

export T∞, P∞, ρ∞, a∞

export vstall, Cl0

end #module


# vim:filetype=julia:foldmethod=syntax
