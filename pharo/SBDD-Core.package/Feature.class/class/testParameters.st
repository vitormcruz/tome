tests
testParameters

	^ self class chain methods;
				    		select: [ :method | (method pragmas collect: #selector) includes: 'scenarioOutline' ]; 
			 			   inject: ParametrizedTestMatrix new 
			 	    		into: [ :testMatrix :scenarioBuilderMethod | 
							 	scenarioBuilderMethod chain 
															 valueWithReceiver: self arguments: #();
													       do: [ :scenario | testMatrix addCase: {#scenarioExample -> scenario} ]
					 		].