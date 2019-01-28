*DomainValidationMagritte-Core
executeValidationsOn: instrumentedObject for: parameters fromContext: context

	^ paramsDescriptions inject: true 
                        into: [ :resultValidation :description | 
                            resultValidation & (description executeValidationsOn: instrumentedObject for: {parameters removeFirst} fromContext: context) 
							   ].
