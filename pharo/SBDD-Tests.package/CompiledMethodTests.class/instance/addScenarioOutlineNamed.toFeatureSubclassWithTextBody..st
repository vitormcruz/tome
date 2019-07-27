utility
addScenarioOutlineNamed: aString toFeatureSubclassWithTextBody: aMehodBodyString

	self addMessageNamed: aString 
		  toClassSideOfClass: FeatureSubclassForTest 
		  WithTextBody: aMehodBodyString 
		  andPragmas: #(scenarioOutline createdForTest).