accessing-properties
empty: aBoolean

	^ [ :value | 
		aBoolean ifTrue: [ true ]
					ifFalse: [ value isNotNil and: [value isNotEmpty]]
	]