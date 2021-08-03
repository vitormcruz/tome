Extension { #name : #Dictionary }

{ #category : #'*Tome-Core' }
Dictionary >> applyAsExampleTo: aScenarioDefinitionString [

	^ aScenarioDefinitionString format: self
]
