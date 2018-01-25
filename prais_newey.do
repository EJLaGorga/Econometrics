 cap log close_all
 log using C:\Users\jlagor01\Documents\HW10, text replace
 clear
 
 use C:\Users\jlagor01\Downloads\HSEINV.DTA

 * Q1 I
 tsset t
 reg linvpc linvpc_1

 quietly reg linvpc t
 predict linvpc_dtrend, residual

 quietly reg linvpc_1 t
 predict linvpc_1_dtrend, residual

 reg linvpc_dtrend linvpc_1_dtrend

 reg lprice lprice_1
 quietly reg lprice t
 predict lprice_dtrend, residual

 quietly reg lprice_1 t
 predict lprice_1_dtrend, residual

 reg lprice_dtrend lprice_1_dtrend

 * Q1 II
 gen delta_lprice = lprice - lprice_1
 reg linvpc delta_lprice t

 * Q1 III
 reg linvpc_dtrend delta_lprice t

 * Q1 IV
 gen delta_linvpc = linvpc - linvpc_1
 reg delta_linvpc delta_lprice t
 
 clear

 use C:\Users\jlagor01\Downloads\PHILLIPS.DTA


 * Q10 I
 tsset year
 reg inf unem

 * Q10 II
 predict uhat, residuals
 gen uhat_1 = uhat[_n-1]
 reg uhat uhat_1
 test uhat_1

 * Q10 III 
 prais inf unem


 * Q10 V
 gen rhohat = e(rho)
 gen infrho = inf / rhohat
 gen unemrho = unem / rhohat
 reg infrho unemrho, noconst

 * Q10 VI
 newey infrho unemrho, lag(1)

 log close 
