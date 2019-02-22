accessing-properties
empty: validationPremisse

	^ [ :value | 
		validationPremisse ifTrue: [ true ]
								ifFalse: [ value isNotNil and: [value isNotEmpty]]
	]