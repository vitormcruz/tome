scenario outline
User_Must_Be_Unique_by_CPF

	<scenario>

	^ self scenarioOutline: 'User must be unique by it''s CPF number'
      		       	   def: 'Given that John was registered with CPF: "001"
        			            When I try to register another user with the CPF: "{newUserCPF}"
           			         Then the result is: "{result}"'
                   
                 examples: #(   newUserCPF    result   ) asHeaderFor 
                	 		  - #(   '001'        fail    )
                 			  - #(   '002'       sucess   )
  
	            		   run: [ :johnCPF  :newUserCPF  :resultExpected |
				
								  userRepository add: (SBDDDummyUser new cpf: johnCPF; name: 'John').
								
	 	           		 	  self assert: ( [ userRepository add: (SBDDDummyUser new cpf: newUserCPF; name: 'Darla').
														'sucess' 
													  ] ifError: [ 'fail' ] )
										 equals: resultExpected.
								 

    		   			   ].