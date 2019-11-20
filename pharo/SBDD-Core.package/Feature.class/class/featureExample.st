as yet unclassified
featureExample

	<scenarioOutline>

	^ self scenarioOutline: 'A User must be a Major'
      		       	  desc: 'Given that John has "{a number}" years old
        			            When I try to register him as a User
           			         Then the result is: "{result}"'
                   
                 examples: #(  'a number'   'result'  ) asHeaderOfExamples
                	 		  - #(    12         fail     )
                 			  - #(    18         sucess   )
                 			  - #(    25         sucess   )
  
	            		   run: [ :aNumber :resultExpected |
 	           		 	  self assert: (aNumber >= 18 ifTrue: ['sucess'] ifFalse: ['fail'])
	 	            		  		 equals: resultExpected.
    		   			   ].