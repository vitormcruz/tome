description
whereParams: aCollection 
	
	paramsDescriptions := aCollection asOrderedCollection.
	
	(paramsDescriptions anySatisfy: [ :paramDescription | paramDescription accessor isNotNil ]) 
	ifTrue: [
		ParamDescriptionError signal: 'Params description of a Method description should not define an accessor. Use paramSelector instead.'
	].
	
	paramsDescriptions size = 1 ifTrue: [ 
		(paramsDescriptions at: 1) accessor selector 
													  isBinary ifFalse: [ Error signal: 'You cannot define a param for an unary message and a binary message',
 																						         ' must defined with a special character, such as "+-/\*~<>=@,%|&?!"'] 
	].

"	accessor := aCollection asMethodAccessor."
	
	
"	accessor := aCollection chain collect: #accessor; 
										  collect: #readSelector; 
										  inject: '' into: [ :combinedPart :newElement | combinedPart , newElement, ':' ];
										  asSymbol; 
										  asAccessor;
										  readSelector: nil.
"