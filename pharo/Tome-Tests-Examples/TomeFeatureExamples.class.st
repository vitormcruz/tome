Class {
	#name : #TomeFeatureExamples,
	#superclass : #TomeFeature,
	#instVars : [
		'userRepository'
	],
	#category : #'Tome-Tests-Examples'
}

{ #category : #scenario }
TomeFeatureExamples >> Add_a_New_User [

	<scenario>

	^ self scenario: 'Add a new User'
      		      def: 'Given a new user named "Sofia"
        			      When I try to register her as a user
           	         Then she is registery "successfully"'
         		   run: [ :userName :result | 
						userRepository add: (TomeDummyUser new name: userName).
						self assert: result equals: 'successfully'
					].
]

{ #category : #scenario }
TomeFeatureExamples >> User_Must_Be_Major_Feature [

	<scenario>

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
]

{ #category : #scenario }
TomeFeatureExamples >> User_Must_Be_Unique_by_CPF [

	<scenario>

	^ self scenarioOutline: 'User must be unique by it''s CPF number'
      		       	   def: 'Given that John was registered with CPF: "001"
        			            When I try to register another user with the CPF: "{newUserCPF}"
           			         Then the result is: "{result}"'
                   
                 examples: #(   newUserCPF    result   ) asHeaderFor 
                	 		  - #(   '001'        fail    )
                 			  - #(   '002'       sucess   )
  
	            		   run: [ :johnCPF  :newUserCPF  :resultExpected |
				
								  userRepository add: (TomeDummyUser new cpf: johnCPF; name: 'John').
								
	 	           		 	  self assert: ( self do: [ userRepository add: (TomeDummyUser new cpf: newUserCPF; name: 'Darla') ] 
					                                 returnOnSuccess: 'sucess' 
					                                 otherwise: 'fail')
										     equals: resultExpected.
								 

    		   			   ].
]

{ #category : #'as yet unclassified' }
TomeFeatureExamples >> do: aBlock returnOnSuccess: objectOnSuccess otherwise: objectOnFail [

    aBlock on: Error do: [ ^ objectOnFail ].
    ^ objectOnSuccess.
]

{ #category : #running }
TomeFeatureExamples >> setUp [
	super setUp.
	userRepository := TomeDummyUserRepository new. 
]
