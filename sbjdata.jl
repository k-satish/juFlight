
# Aerodynamic constants
Cd0   = 0.023
K     = 0.073
Clmax = 1.24 # co-efficient of lift(Hull, pg.84)
Sw    = ft²2m²(232) # Planform area of wing (m^2)
Wi    = lb2kg(13000)*g0 # Initial mass of A/C Wi=Mi*g % kg
Wf    = lb2kg(8000)*g0 # Final mass of A/C Wf= Mf*g % kg
W     = lb2kg(11000)*g0 # Cruise weight W=Mg (Kg)
T     = lb2kg(1080) # Thrust is given in lb converting it into kg
qmax  = 300*47.88 #lb/ft2 to N/m2
Mmax  = 0.81


# vim:filetype=julia:foldmethod=syntax


