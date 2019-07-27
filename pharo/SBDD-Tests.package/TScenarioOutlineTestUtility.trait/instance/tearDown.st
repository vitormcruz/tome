running
tearDown 

	(self classesWithMethodsGenerated) do: [ :class | 
		(class methods, class class methods) chain 
														select: [ :method | method isAMethodCreatedForTest];
													   do: [:method | method origin removeSelector: method selector ].
	].
													
	super tearDown.