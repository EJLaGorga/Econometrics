cap log close _all
log using C:\Users\jlagor01\Documents\hw5.log, text replace
clear

use C:\Users\jlagor01\Downloads\MEAP93.DTA

* A.1
gen logtotcomp = log(totcomp)
gen logstaff = log(staff)
gen logenroll = log(enroll)

reg math10 totcomp staff enroll
reg math10 logtotcomp logstaff logenroll
test logtotcomp = 10

* A.2
test logtotcomp = 10
test logstaff = 1

* A.3
scalar nobs = e(N)
scalar rssU = e(rss)
scalar ncoefsU = e(df_m) + 1

gen math10_Ho = [math10 - (10 * logtotcomp) - logstaff]
reg math10_Ho logenroll
scalar rssR = e(rss)
scalar ncoefsR = e(df_m) + 1

scalar nrestr = ncoefsU - ncoefsR
scalar Fhat = [(rssR-rssU)/(nrestr)]/[rssU/(nobs-ncoefsU)]

scalar pF = Ftail(nrestr, nobs-ncoefsU, Fhat)
display pF

* A.4
reg math10 logtotcomp logstaff logenroll
test (logtotcomp = 10)(logstaff = 1)

log close
clear
