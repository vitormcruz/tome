scenarioSpecification
fillStep: step withParams: params

    ^ params inject: step 
				 into: [ :convertedStep :param | 
				     convertedStep copyReplaceAll: ('' join: {${.param key.$}}) 
										 with: (param value surroundedBy: '"') 
				 ]