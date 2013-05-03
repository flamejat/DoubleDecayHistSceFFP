context("DoubleDecay");

db = readMat( "../db.mat" );

Infl = db$Data[ , length( db$Names ) ];
Vix = db$Data[ , length( db$Names )-1 ];
Crude = db$Data[ , length( db$Names )-3 ];
Swp10 = db$Data[ , 2 ];
SnP = db$Data[ , 4 ];

X = diff( log( cbind( SnP, Vix, Swp10 ) ) );
l_c = 0.0055;
l_s = 0.0166;



test_that("DoubleDecay returns the right object",{

	Dd = DoubleDecay(X, l_c, l_s);

	expect_that( Dd, is_a("list"));
	expect_that( Dd$m, is_a("matrix"));
	expect_that( Dd$S, is_a("matrix"));

	#expect_that( nrow( Dd$S ), equals( ncol( Dd$S )));
	#expect_that( Dd$m, equals( ) );	

})


