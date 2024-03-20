Class {
	#name : #TomeFeatureExamples,
	#superclass : #TomeFeature,
	#instVars : [
		'userRepository'
	],
	#category : #'Tome-Tests-Examples'
}

{ #category : #scenario }
TomeFeatureExamples >> User_Must_Be_Major_Feature [

	<scenario>

	^ self 
		scenarioOutline: 'User must be Major'
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

{ #category : #scenario }
TomeFeatureExamples >> a_Change_User_Salary [
	"A simple example of a Scenario that tests for a change of an user salary:
		1- Every text surrounded by quotation marks become parameters injected into the run block in order;
		2- Every paramerter that starts with an ""equals:"" string becomes an assertion parameter;
		3- A Scenario is only successful if all parameters are used and no error is raised.
		
	Look for the other alternatives for other options of implementations.
	"

	<scenario>
	^ self	
		scenario: 'Change User Salary'
		def: 'Given am already registered user with a monthly wage of $"1000"
				 her current yearly wage is $"equals: 12000""
				 When I change her salary to $"2000"
				 Then her yearly salary becomes "equals: 24000"'
		run: [ :currentMonthlyWage :assertCurrentYearlyWage :newMonthlyWage :assertNewYearlyWage |
			| user |
			
			user := TomeDummyUser new name: 'User1'; monthlyWage: currentMonthlyWage.

			"Is the current yearly wage the expected value?"
			assertCurrentYearlyWage assertSuccessFor: user yearlyWage.
			
			user monthlyWage: newMonthlyWage.

			"Is the new yearly wage the expected value?"
			assertNewYearlyWage assertSuccessFor: user yearlyWage.
		]
]

{ #category : #scenario }
TomeFeatureExamples >> a_Change_User_Salary_More_Terse_Implementation_1 [

	"Instead of putting the validation of the state before changes on the scenario, doing it only on the 
	implementation. The advantage is the terseness of the Scenario, but the link to the code will
	be weaker, meaning that changes to the scenario may not reflect on it's execution.
	
	(Disclaimer: I think this one is better in this case. Scenarios been readble and expressive trumps 
	detailed linkage to the code).
	"

	<scenario>
	^ self	
		scenario: 'Change User Salary More Terse Implementation 1'
		def: 'Given am already registered user with a monthly wage of $"1000"
				 When I change her salary to $"2000"
				 Then her yearly salary becomes "equals: 24000"'
		run: [ :currentMonthlyWage :newMonthlyWage :assertNewYearlyWage |
			| user |
			
			user := TomeDummyUser new name: 'User1'; monthlyWage: currentMonthlyWage.
			
			"You can run adhoc assertions as needed"
			self assert: user yearlyWage equals: 12000.
			
			user monthlyWage: newMonthlyWage.

			"Is the new yearly wage the expected value?"
			assertNewYearlyWage assertSuccessFor: user yearlyWage.
		]
]

{ #category : #scenario }
TomeFeatureExamples >> a_Change_User_Salary_More_Terse_Implementation_2 [

	"Same as the other, but using assertions provided by Tome."

	<scenario>
	^ self	
		scenario: 'Change User Salary More Terse Implementation 2'
		def: 'Given am already registered user with a monthly wage of $"1000"
				 When I change her salary to $"2000"
				 Then her yearly salary becomes "equals: 24000"'
		run: [ :currentMonthlyWage :newMonthlyWage :assertNewYearlyWage |
			| user |
			
			user := TomeDummyUser new name: 'User1'; monthlyWage: currentMonthlyWage.
			
			"Store the assertion actual value. If a block is passed, it will evaluate lazilly"
			assertNewYearlyWage assertionActualValue: [ user yearlyWage ].
			
			"Instead of an AdHoc assertion, testFail will see if the assertion fails, 
			garanteeing that the state before changes is diffent then the new expected 
			after changes. "
			assertNewYearlyWage testFail.
		
			user monthlyWage: newMonthlyWage.

			"Is the new yearly wage the expected value? Since assertion is stored, no need to pass it again"
			assertNewYearlyWage assertSuccess.
		]
]

{ #category : #scenario }
TomeFeatureExamples >> a_Change_User_Salary_More_Terse_Implementation_3 [

	"Now using the when clause of the assertion, it will: 
		1- Verify if the state before *when* execution is different than the expected value (testFail);
		2- Execute the when clause;
		3- Assert that the expected value was got after the when clause execution (assertSuccess)
	
	 The objective of these examples was to show the API provided by Tome and that it can be used interchangeably
	 with the system assertions.
	"

	<scenario>
	^ self	
		scenario: 'Change User Salary More Terse Implementation 3'
		def: 'Given am already registered user with a monthly wage of $"1000"
				 When I change her salary to $"2000"
				 Then her yearly salary becomes "equals: 24000"'
		run: [ :currentMonthlyWage :newMonthlyWage :assertNewYearlyWage |
			| user |
			
			user := TomeDummyUser new name: 'User1'; monthlyWage: currentMonthlyWage.
			
			assertNewYearlyWage	when: [ user monthlyWage: newMonthlyWage ]
											assertFor: [ user yearlyWage ].
		]
]

{ #category : #scenario }
TomeFeatureExamples >> b_Add_a_New_User_1_Ill_Conceived [

	"This is an ill conceived scenario created only to show a limitation of the framework."

	<scenario>

	^ self
		scenario: 'Add a new User Ill Conceived'
		def: 'Given a new user named "Sofia"
  		      When I try to register her as a user
  	         Then she is registery "successfully"'
  	   run: [ :userName :result | 
			userRepository add: (TomeDummyUser new name: userName).
			"Every param must be used, so that the proper linkage with the Specification is made.
			Any usage is registered as used, e.g., if userName were concatenated with another string, 
			'markused' would be redundant. The exceptional case is attribution, which cannot be 
			instrumented to make it's usage aware, so 'markUsed' is necessary (or some dummy call to the param)"
			userName markUsed. 
			self assert: result equals: 'successfully'.
		].
]

{ #category : #scenario }
TomeFeatureExamples >> b_Add_a_New_User_2_Implementation_1 [

	"This is a beter implementation of the scenario, vecause it validate (asserts) actual 
	examples and it's data. Note that 'markUsed' is not even necessary anymore, because 
	the implemetnation actually uses it to assert the criteria."

	<scenario>

	^ self 
		scenario: 'Add a new User Better Scenario Implementation 1'
		def:	'Given a new user named "Sofia"
				 When I register her as a user
				 Then "equals: ''Sofia''" can be found on the system'
     run: [ :userName :assertSofiaFound | 
			userRepository add: (TomeDummyUser new name: userName).
			assertSofiaFound assertSuccessFor: [ self findNameOnRepository: userName ]
		].
]

{ #category : #scenario }
TomeFeatureExamples >> b_Add_a_New_User_3_Implementation_2 [
	"Using the when clause. It will test if the previous state of the system is not equal 
	to the epected one."

	<scenario>
	^ self
		  scenario: 'Add a new User Better Scenario Implementation 2'
		  def: 'Given a new user named "Sofia"
				 When I register her as a user
				 Then "equals: ''Sofia''" can be found on the system'
		  run: [ :userName :assertSofiaFound |
			  assertSofiaFound
				  when: [ userRepository add: (TomeDummyUser new name: userName) ]
				  assertFor: [ self findNameOnRepository: userName ]
			  ]
]

{ #category : #'test util' }
TomeFeatureExamples >> do: aBlock returnOnSuccess: objectOnSuccess otherwise: objectOnFail [

    aBlock on: Error do: [ ^ objectOnFail ].
    ^ objectOnSuccess.
]

{ #category : #scenario }
TomeFeatureExamples >> findNameOnRepository: userName [

	^ (userRepository collect: #name)
		  detect: [ :usrName | usrName = userName ]
		  ifNone: [ 'UsrNotFund' ]
]

{ #category : #running }
TomeFeatureExamples >> setUp [
	super setUp.
	userRepository := TomeDummyUserRepository new. 
]
