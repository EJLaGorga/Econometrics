* Part B
clear
program drop _all

set seed 19876

program define hw5_sim, rclass
drop _all

set obs 500

tempvar x
gen `x' = rnormal(10,4)

tempvar u
gen `u' = rnormal(0,3)

tempvar y
gen `y' = 5 + 1*`x' + `u'

reg `y' `x' 

tempvar btemp
matrix `btemp' = e(b)
return scalar b1sim = `btemp'[1,1]

end

simulate b1=r(b1sim), nodots reps(300): hw5_sim

cap log close _all
log using C:\Users\jlagor01\Documents\hw5B.log, text replace

sum b1 , detail
histogram b1 , bin(30) normal 
graph export "C:\Users\jlagor01\Documents\hw5B_500obs.pdf", as(pdf) replace

log close
