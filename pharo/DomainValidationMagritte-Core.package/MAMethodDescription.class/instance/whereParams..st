description
whereParams: aCollection 
	paramsDescriptions := aCollection asOrderedCollection.
	
	accessor := aCollection chain collect: #accessor; 
										  collect: #writeSelector; 
										  reduce: [ :reducedPart :element | reducedPart , element ];
										  asSymbol; 
										  asAccessor.
