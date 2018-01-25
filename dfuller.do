 cap log close_all
 log using C:\Users\jlagor01\Documents\HW11, text replace
 clear
 
 use C:\Users\jlagor01\Downloads\INTQRT.DTA
 
 gen t = _n
 tsset t
 
 * Q.1
 dfuller hy6, lag(2) trend
 
 * Q.2
 dfuller hy3_1, lag(2) trend

 * Q.3
 reg hy6 hy3_1
 predict uhat, residuals
 dfuller uhat
 
 * Q.4 
 reg hy6 hy3_1
 reg hy6 hy3_1 D.F1.hy3_1 D.F2.hy3_1  D.L1.hy3_1 D.L2.hy3_1 
 
 * Q.5
 matrix coef = e(b)
 scalar B = coef[1,1]
 gen errc = L.hy6 - B * L.hy3_1
 reg D.hy6 D.hy3_1 errc
 
 log close
