scenario outline
User_Must_Be_Major_Feature

	<scenarioOutline>

	^ self scenarioOutline: 'User must be Major'
      		       	   def: 'Given that John has "{a number}" years old
        			            When I try to register him as a User
           			         Then the result is: "{result}"'
                   
                 examples: #(  'a number'   'result'  ) asHeaderFor 
                	 		  - #(    12         fail    )
                 			  - #(    18         sucess   )
                 			  - #(    25         sucess   )
  
	            		   run: [ :aNumber :resultExpected |
 	           		 	  self assert: (aNumber >= 18 ifTrue: [ 'sucess' ] ifFalse: [ 'fail' ])
	 	            		  		 equals: resultExpected.
    		   			   ].