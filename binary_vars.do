 cap log close_all
 log using C:\Users\jlagor01\Documents\hw6, text replace
 clear
 
 use C:\Users\jlagor01\Downloads\SLEEP75.DTA
 
 *pooled model
 gen age2 = age^2
 reg sleep totwrk educ age age2 yngkid
 
 *i
 reg sleep totwrk educ age age2 yngkid if male==1
 reg sleep totwrk educ age age2 yngkid if male==0
 
 *2
 gen totwrk_m = totwrk * male
 gen educ_m = educ * male
 gen age_m = age * male
 gen age2_m = age2 * male
 gen yngkid_m = yngkid * male
 
 reg sleep totwrk educ age age2 yngkid totwrk_m educ_m age_m age2_m yngkid_m male
 test totwrk_m educ_m age_m age2_m male
 
 
 *3
 test totwrk_m educ_m age_m age2_m yngkid_m
 
 *5
 reg sleep totwrk educ age age2 yngkid if male==1
 scalar obs_m = e(N)
 scalar sse_m = e(rss)
 
 reg sleep totwrk educ age age2 yngkid if male==0
 scalar obs_w = e(N)
 scalar sse_w = e(rss)
 
 reg sleep totwrk educ age age2 yngkid
 scalar obs_t = e(N)
 scalar sse_t = e(rss)
 scalar res_t = e(df_m) + 1

 * i found this equation online lol 
 * lmk if correct via email john.lagorga@tufts.edu
 scalar num = ((sse_t - sse_m - sse_w)/res_t) 
 scalar den = ((sse_m + sse_w)/(obs_m + obs_w - 2*res_t)) 
 scalar Fhat = num/den
 
 scalar pF = Ftail(res_t, obs_t-res_t, Fhat)
 
 display "Fhat = " Fhat , ", p-value = " pF
 
 log close
