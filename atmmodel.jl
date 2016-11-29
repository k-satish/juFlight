
# Temperature variation with altitude taken from 'introduction to flight' 
# by  J. D. Anderson chapter 3 Pg No 120 

# Model works only for troposphere. Hence, returning "-1" as error if the altitude is greater than 11000.
T∞(h) = map( x -> x > 11000 ? 216.66 : Tsl + x*a, h)
# TODO - expression for pressure after 11000
P∞(h) = map(x -> x < 11000 ? Psl*(T∞(x)/Tsl)^-((g0/(a*R))) : -1, h)
ρ∞(h) = P∞(h)./(R*T∞(h))
a∞(h) = √(γ*R*T∞(h))

# vim:filetype=julia:
