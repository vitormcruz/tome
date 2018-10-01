*SBDD-Core
isTestMethod: aMethod

	aMethod methodClass isTestCase
		ifFalse: [ ^ false ].
	aMethod numArgs isZero
		ifFalse: [ ^ false ].

	"unary selectors starting with 'should' are supposed to be treated as test methods too"
	^ (aMethod selector beginsWith: 'test') or: [ aMethod selector beginsWith: 'should' ]