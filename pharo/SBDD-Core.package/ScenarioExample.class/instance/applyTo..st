converting
applyTo: aString 

	| formatParameters |
	
	formatParameters := Dictionary new.
	exampleHeader paddedWith: exampleValues do: [ :header :value |
		formatParameters add: header -> value.
	].
	
	^ aString format: formatParameters. 