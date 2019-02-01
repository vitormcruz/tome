description
whereParams: aCollection 
	
	paramsDescriptions := aCollection asOrderedCollection.
	
	paramsDescriptions size = 1 ifTrue: [ 
		(paramsDescriptions at: 1) accessor selector 
													  isBinary ifFalse: [ Error signal: 'You cannot define a param for an unary message and a binary message',
 																						         ' must defined with a special character, such as "+-/\*~<>=@,%|&?!"'] 
	].

	accessor := aCollection chain collect: #accessor; 
										  collect: #writeSelector; 
										  reduce: [ :reducedPart :element | reducedPart , element ];
										  asSymbol; 
										  asAccessor.
