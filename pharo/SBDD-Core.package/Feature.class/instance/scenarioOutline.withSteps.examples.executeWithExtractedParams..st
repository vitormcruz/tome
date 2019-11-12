scenarioSpecification
scenarioOutline: scenarionTempleteName withSteps: aStepCollection examples: orderedCollectionOfExamples executeWithExtractedParams: aBlockClosure
	
	^ orderedCollectionOfExamples allButFirst withIndexCollect: [ :example : i| 
		scenarionTempleteName , '_', i asString.
	].

"    ^ anExampleOrderedCollection asColumnAssociatedWithData do: [ :exampleParams | 
              self scenario: scenarionName
                   withSteps: (aStepCollection collect: [ :parametrizedStep | self fillStep: parametrizedStep withParams: exampleParams ])
                   executeWithExtractedParams: aBlockClosure 
      ]

"