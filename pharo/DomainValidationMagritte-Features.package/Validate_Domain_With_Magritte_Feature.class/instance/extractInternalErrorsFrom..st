test  support
extractInternalErrorsFrom: aString 
	^ aString findTokens: {', '. 'and'}