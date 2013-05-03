context("Fit2Moms");

Infl = db$Data[ , length( db$Names ) ];
Vix = db$Data[ , length( db$Names )-1 ];
Crude = db$Data[ , length( db$Names )-3 ];
Swp10 = db$Data[ , 2 ];
SnP = db$Data[ , 4 ];

X = diff( log( cbind( SnP, Vix, Swp10 ) ) );
l_c = 0.0055;
l_s = 0.0166;

Dd = DoubleDecay(X, l_c, l_s);

X = diff( log( cbind( SnP, Vix, Swp10 ) ) );

test_that("Fit2Moms returns the right object",{

	p = Fit2Moms( X, Dd$m, Dd$S );

	expect_that( p, is_a("list"));
	expect_that( p$p_, is_a("matrix"));
	expect_that( p$optimizationPerformance, is_a("list"));

})

