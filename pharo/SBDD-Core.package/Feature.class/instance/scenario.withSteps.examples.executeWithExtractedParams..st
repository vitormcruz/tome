scenarioSpecification
scenario: scenarionName withSteps: aStepCollection examples: anExampleOrderedCollection executeWithExtractedParams: aBlockClosure

    ^ anExampleOrderedCollection asColumnAssociatedWithData do: [ :exampleParams | 
              self scenario: scenarionName
                   withSteps: (aStepCollection collect: [ :parametrizedStep | self fillStep: parametrizedStep withParams: exampleParams ])
                   executeWithExtractedParams: aBlockClosure 
      ]