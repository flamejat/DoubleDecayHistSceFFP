#'This script uses Entropy Pooling to compute Fully Flexible Probabilities for historical scenarios
#'based on time periods, market conditions, constraints on moments, etc., as described in
#'A. Meucci, "Personalized Risk Management: Historical Scenarios with Fully Flexible Probabilities"
#'GARP Risk Professional, Dec 2010, p 47-51
#'
#' Most recent version of article and code available at
#' http://www.symmys.com/node/150
#' @references 
#' \url{http://www.symmys.com/node/150}
#' See Meucci script for "DoubleDecay.m"
#' 
#' @author Xavier Valls \email{flamejat@@gmail.com}
#' @export

library( R.matlab )

source("DoubleDecay.R")

source("Fit2Moms.R")

##########################################################################
# risk drivers scenarios
###########################################################################

db = readMat( "data/db.mat" )

Infl = db$Data[ , length( db$Names ) ];
Vix = db$Data[ , length( db$Names )-1 ];
#Crude = db$Data[ , length( db$Names )-3 ];
Swp10 = db$Data[ , 2 ];
SnP = db$Data[ , 4 ];

X = diff( log( cbind( SnP, Vix, Swp10 ) ) );
Y = Infl[ 1:nrow( db$Data )-1];

##########################################################################
#assign probabilities to historical scenarios
###########################################################################

#partial information: match covariance

l_c = 0.0055;
l_s = 0.0166;

N = 20;
Dd = DoubleDecay( X, l_c, l_s );

p = Fit2Moms( X, Dd$m, Dd$S );
