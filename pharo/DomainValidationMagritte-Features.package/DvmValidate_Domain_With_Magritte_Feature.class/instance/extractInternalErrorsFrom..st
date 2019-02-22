test  support
extractInternalErrorsFrom: aString 
	^ aString chain 
				 findTokens: {', '. 'and'};
				 copyWithout: 'no error'.