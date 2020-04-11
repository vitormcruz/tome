running
setUp
	<deprecated:  'Fix for parametrized tests. Wait until, fiz in the image.'>
	
	self parametersToUse do: [ :aParameter | aParameter applyTo: self ].
	
	"If I am executed without calling buildSuite in the class. I will use the first set of options.
	This is a workaround to work when running from Calypso"
	(self parametersToUse isEmpty and: [self class testParameters expandMatrix isNotEmpty]) 
		ifTrue: [ 
				self class 
						testParameters expandMatrix first 
						do: [ :aParameter | aParameter applyTo: self ] ]