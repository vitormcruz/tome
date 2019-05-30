instanceCreation
from: aSelectorAccessor atIndex: aNumber 

	aSelectorAccessor selector isUnary ifTrue: [ 
		Error signal: 'You cannot define a param for an unary message' 
	].

	[aNumber ~= 1], [ aSelectorAccessor selector isBinary ] ifAllTrue: [ 
		Error signal: 'You cannot define more than one param for a binary message' 
	].

	^ self new selectorAccessor: aSelectorAccessor; index: aNumber.