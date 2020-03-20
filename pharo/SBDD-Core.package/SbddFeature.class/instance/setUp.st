building suites
setUp 

	super setUp.
	self parametersToUse do: [ :aParameter | aParameter applyTo: self ].
	
	"If I am executed without calling buildSuite in the class. I will use the first set of options.
	This is a workaround to work when running from Calypso"
	(self parametersToUse isEmpty and: [self testParameters isNotEmpty]) 
		ifTrue: [ 
				self testParameters expandMatrix first do: [ :aParameter | aParameter applyTo: self ] ]

