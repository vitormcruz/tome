var accessors
- aCollection 
	examples add: (header asFormatParametersOf: aCollection).
	
"	| formatParameters |
	
	formatParameters := Dictionary new.
	exampleHeader paddedWith: exampleValues do: [ :header :value |
		formatParameters add: header -> value.
	].
	
	^ aString format: formatParameters. "