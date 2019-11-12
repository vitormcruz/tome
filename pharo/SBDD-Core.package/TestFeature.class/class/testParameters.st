tests
testParameters

	^ self class chain 
			 		 thoroughWhichSelectorsReferTo: #scenarioOutline:desc:examples:run:;
					 select: [ :it | it ~= #testParameters ];
			 		 inject: ParametrizedTestMatrix new 
			 	    into: [ :testMatrix :scenarioBuilderSelector | 
					 	scenarioBuilderSelector chain 
										 			   perform: scenarioBuilderSelector ; 
											         do: [ :scenario | testMatrix addCase: {#scenarioExample -> scenario} ]
					 ].