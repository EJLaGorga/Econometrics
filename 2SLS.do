 cap log close_all
 log using C:\Users\jlagor01\Documents\HW8, text replace
 clear
 
 use C:\Users\jlagor01\Downloads\CARD-1.DTA
 
 * Q.1
 gen log_wage = log(wage)
 reg log_wage educ exper expersq black smsa south ///
 smsa66 reg662 reg663 reg664 reg665 reg666 reg667 reg668 reg669
 
 * Q.2
 ivregress 2sls log_wage exper expersq black smsa south ///
 smsa66 reg662 reg663 reg664 reg665 reg666 reg667 reg668 reg669 (educ = nearc4)
 predict stder1, stdp
 display stder1
 
 * Q.3
 reg educ exper expersq black smsa south nearc4 ///
 smsa66 reg662 reg663 reg664 reg665 reg666 reg667 reg668 reg669
 predict yhat1, xb
 
 reg log_wage yhat1 exper expersq black smsa south ///
 smsa66 reg662 reg663 reg664 reg665 reg666 reg667 reg668 reg669
 predict stder2, stdp
 display stder2
 
 * Q.4
 reg educ exper expersq black smsa south nearc4 ///
 smsa66 reg662 reg663 reg664 reg665 reg666 reg667 reg668 reg669
 test (exper expersq black smsa south nearc4 smsa66 ///
 reg662 reg663 reg664 reg665 reg666 reg667 reg668 reg669)
 
 * Q.5
 reg educ exper expersq black smsa south nearc4 ///
 smsa66 reg662 reg663 reg664 reg665 reg666 reg667 reg668 reg669
 predict vhat, residuals

 reg log_wage educ exper expersq black smsa south vhat ///
 smsa66 reg662 reg663 reg664 reg665 reg666 reg667 reg668 reg669
 test (vhat)
 
 * Q.6
 ivregress 2sls log_wage exper expersq black smsa south ///
 smsa66 reg662 reg663 reg664 reg665 reg666 reg667 reg668 reg669 ///
 (educ = nearc4 nearc2)
 
 * Q.7
 predict resid, residuals
 reg resid educ exper expersq black smsa south ///
 smsa66 reg662 reg663 reg664 reg665 reg666 reg667 reg668 reg669
 
 
 
 log close
