library('testthat');
 
source('DoubleDecay.R');
source('Fit2Moms.R')
 
test_dir('./tests', reporter = 'minimal');