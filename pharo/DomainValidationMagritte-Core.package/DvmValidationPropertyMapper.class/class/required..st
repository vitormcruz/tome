accessing-properties
required: validationPremisse

	^ [:value | 
			validationPremisse ifTrue: [ value isNotNil ]
									 ifFalse: [ true ]	      
	  ].