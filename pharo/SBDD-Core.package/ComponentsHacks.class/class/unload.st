cleanup
unload 

	CompiledMethod compile: 'isTestMethod
	self numArgs isZero
		ifFalse: [ ^ false ].
	"unary selectors starting with ''should'' are supposed to be treated as test methods too"
	((self selector beginsWith: ''test'') or: [ self selector beginsWith: ''should'' ])
		ifFalse: [ ^ false ].
	"Is the receiver a TestCase test method?"
	self methodClass isTestCase
		ifFalse: [ ^ false ].
	^true
	'.

	ClySystemEnvironmentPlugin removeSelector: #isTestMethod:.
	
	ClySUnitEnvironmentPlugin compile: 'isTestMethod: aMethod
	
	aMethod numArgs isZero ifFalse: [ ^ false ].
	"unary selectors starting with ''should'' are supposed to be treated as test methods too"
	((aMethod selector beginsWith: ''test'') or: [ aMethod selector beginsWith: ''should'' ])
		ifFalse: [ ^ false ].
	
	^self isTestClass: aMethod methodClass'.
	
	super unload.