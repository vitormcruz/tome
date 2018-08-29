scenarioSpecification
scenario: scenarionName withSteps: aCollection examples: aDataFrame executeWithExtractedParams: aBlockClosure

    ^ aDataFrame rowsAsColumnAssociatedWithData do: [ :params | 
              self scenario: scenarionName
                   withSteps: (aCollection collect: [ :parametrizedStep | self fillStep: parametrizedStep withParams: params ])
                   executeWithExtractedParams: aBlockClosure 
      ]