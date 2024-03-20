Class {
	#name : #TomeScenarioTest,
	#superclass : #TestCase,
	#category : #'Tome-Tests'
}

{ #category : #'tests - scenarios execution' }
TomeScenarioTest >> test_create_scenario_without_mandatory_params [

	self should: [ (TomeScenario withName: nil definition: nil executionBlock: nil) run ] 
		  raise: Error 
		  withExceptionDo: [ :ex | self assert: ex messageText
												 equals: 'Following errors found while creating a new Feature: scenario_mandatory_name, ', 
														   'scenario_mandatory_step_definition, scenario_mandatory_executionBlock' 
		 ]
]

{ #category : #'tests - using parameters' }
TomeScenarioTest >> test_scenario_N_regular_parameters_using_all [

    | scenario |
        
    scenario := TomeScenario withName: 'Test Scenario' 
                             definition: 'Scenario normal parameters: "1" and "2"' 
                             executionBlock: [ :param1 :param2 | 
												param1 + param2.
											].
       
        
    self should: [ scenario run. true ] description: 'Should have run the scenario without error'.
]

{ #category : #'tests - using parameters' }
TomeScenarioTest >> test_scenario_N_regular_parameters_using_some [

    | scenario |
        
    scenario := TomeScenario withName: 'Test Scenario' 
                             definition: 'Scenario normal parameters: "1" and "2"' 
                             executionBlock: [ :param1 :param2 | 
												param1 + 1.
											].
       
    self should: [ scenario run ] 
         raise: TestFailure 
         withExceptionDo: [ :ex | self assert: ex messageText 
	                                    equals: 'TomeParameter ("2") should be used so that scenario execution pass.'].
]

{ #category : #'tests - using parameters' }
TomeScenarioTest >> test_scenario_One_regular_parameter_dont_using_it [

    | scenario |
        
    scenario := TomeScenario withName: 'Test Scenario' 
                             definition: 'Scenario normal parameters: "test"' 
                             executionBlock: [ :param1 | ].
       
        
    self should: [ scenario run ] 
         raise: TestFailure 
         withExceptionDo: [ :ex | self assert: ex messageText 
	                                    equals: 'TomeParameter ("test") should be used so that scenario execution pass.'].
]

{ #category : #'tests - using parameters' }
TomeScenarioTest >> test_scenario_One_regular_parameter_using_it [

    | scenario |
        
    scenario := TomeScenario withName: 'Test Scenario' 
                             definition: 'Scenario normal parameters: "1"' 
                             executionBlock: [ :param1 | 
												param1 + 1.
											].
       
        
    self should: [ scenario run. true ] description: 'Should have run the scenario without error'.
]

{ #category : #'tests - using parameters' }
TomeScenarioTest >> test_scenario_not_asserting_N_assertion_parameters [

    | scenario |
        
    scenario := TomeScenario withName: 'Test Scenario' 
                             definition: 'Scenario with multiple parameters: "equals: 3", "equals: 2" and "equals: 1. But also "test" "2"' 
                             executionBlock: [ :param :param2 :param3 :param4 :param5 | "not calling assertSuccessFor: should fail the scenario" ].
        
    self should: [ scenario run ] 
         raise: TestFailure 
         withExceptionDo: [ :ex | self assert: ex messageText 
	                                    equals: 'Assertion parameter ("equals: 3") should be used so that scenario execution pass.'].
]

{ #category : #'tests - using parameters' }
TomeScenarioTest >> test_scenario_not_asserting_One_assertion_parameter [

    | scenario |
        
    scenario := TomeScenario withName: 'Test Scenario' 
                             definition: 'Scenario with a single parameter: "equals: 1"' 
                             executionBlock: [ :param | "not calling assertSuccessFor: should fail the scenario" ].
        
    self should: [ scenario run ] 
         raise: TestFailure 
         withExceptionDo: [ :ex | self assert: ex messageText 
	                                    equals: 'Assertion parameter ("equals: 1") should be used so that scenario execution pass.'].
]

{ #category : #'tests - using parameters' }
TomeScenarioTest >> test_scenario_using_all_N_parameters [

    | scenario |
        
    scenario := TomeScenario withName: 'Test Scenario' 
                             definition: 'Scenario with multiple parameters: "equals: 1" and "equals: 2" "equals: 3"
                                          and also with some normal parameters:  "teste", "2" and "teste2"' 
                             executionBlock: [ :param1 :param2 :param3 :param4 :param5 :param6 | 
												param1 assertionActualValue: 1.
												param1 assertSuccess.
												param2 assertionActualValue: 2.
												param2 assertSuccess.
												param3 assertionActualValue: 3.
												param3 assertSuccess.
                                 param4, param6.
                                 param5 + 1
                             ].
       
        
    self should: [ scenario run. true ] description: 'Should have run the scenario without error'.
]

{ #category : #'tests - scenario assertions' }
TomeScenarioTest >> test_scenario_with_N_failing_assertion_params [

    | scenario |
        
    scenario := TomeScenario withName: 'Test Scenario' 
                             definition: 'Scenario with a single parameter: "equals: 1", "equals: 2" and "equals: 3"' 
                             executionBlock: [ :param :param2 :param3 | 
												param assertionActualValue: 2.
												param assertSuccess.
												param2 assertionActualValue: 3.
												param2 assertSuccess.
												param3 assertionActualValue: 1.
												param3 assertSuccess.
	                          ].
        
    self should: [ scenario run ] raise: TestFailure.
]

{ #category : #'tests - scenario assertions' }
TomeScenarioTest >> test_scenario_with_N_passing_assertion_params [

    | scenario |
        
    scenario := TomeScenario withName: 'Test Scenario' 
                             definition: 'Scenario with a single parameter: "equals: 1", "equals: 2" and "equals: 3"' 
                             executionBlock: [ :param :param2 :param3 | 
												param assertionActualValue: 1.
												param assertSuccess.
												param2 assertionActualValue: 2.
												param2 assertSuccess.
												param3 assertionActualValue: 3.
												param3 assertSuccess.
	                          ].
        
    self should: [ scenario run. true ] description: 'Should have run the scenario without error'.
]

{ #category : #'tests - scenario assertions' }
TomeScenarioTest >> test_scenario_with_One_failing_assertion_param [

    | scenario |
        
    scenario := TomeScenario withName: 'Test Scenario' 
                             definition: 'Scenario with a single parameter: "equals: 1"' 
                             executionBlock: [ :param | 
												param assertionActualValue: 2.
												param assertSuccess 
											].
        
    self should: [ scenario run ] raise: TestFailure.
]

{ #category : #'tests - scenario assertions' }
TomeScenarioTest >> test_scenario_with_One_passing_assertion_param [

    | scenario |
        
    scenario := TomeScenario withName: 'Test Scenario' 
                             definition: 'Scenario with a single parameter: "equals: 1"' 
                             executionBlock: [ :param | 
												param assertionActualValue: 1.
												param assertSuccess 
											].
        
    self should: [ scenario run. true ] description: 'Should have run the scenario without error'.
]

{ #category : #'tests - using parameters' }
TomeScenarioTest >> test_scenario_with_no_parameters [

	| scenario |
	
	scenario := TomeScenario
		            withName: 'Test Scenario'
		            definition: 'Scenario with no parameters'
		            executionBlock: [  ].

	self	should: [ scenario run ] 
			raise: TestFailure withExceptionDo: [ :ex |
				self assert: ex messageText
						equals: 'Feature without params. This means the feature is not linked to the test code which trumps the runnable specification objective'
			]
]
