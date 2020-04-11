scenario outline
User_Must_Be_Unique_by_CPF

	<scenarioOutline>

	^ self scenarioOutline: 'User must be unique by it''s CPF number'
      		       	   def: 'Given that John was registered with CPF: "001"
        			            When I try to register another user with the CPF: "{newUserCPF}"
           			         Then the result is: "{result}"'
                   
                 examples: #(   newUserCPF    result   ) asHeaderFor 
                	 		  - #(   '001'        fail    )
                 			  - #(   '002'       sucess   )
  
	            		   run: [ :johnCPF  :newUserCPF  :resultExpected |
				
								  cpfRepository add: johnCPF.
								
	 	           		 	  self assert: ( [ cpfRepository add: newUserCPF.
														'sucess' 
													  ] ifError: [ 'fail' ] )
										 equals: resultExpected.
								 

    		   			   ].