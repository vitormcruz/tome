running
tearDown 

	(FeatureSubclassForTest methods, 
	FeatureSubclassForTest class methods) chain 
													 select: [ :method | method isAMethodCreatedForTest];
													 do: [:method | method origin removeSelector: method selector ].
													
	super tearDown.