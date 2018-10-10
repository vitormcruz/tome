as yet unclassified
extractInternalErrorsFrom: aString 
	^ aString findTokens: {', '. 'and'}