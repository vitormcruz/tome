Class {
	#name : #TomeFeatureScenarioTest,
	#superclass : #TestCase,
	#category : #'Tome-Tests'
}

{ #category : #'tests - scenarios execution' }
TomeFeatureScenarioTest >> test_create_scenario_without_mandatory_params [

	self should: [ (TomeScenario withName: nil definition: nil executionBlock: nil) run ] 
		  raise: Error 
		  withExceptionDo: [ :ex | self assert: ex messageText
												 equals: 'Following errors found while creating a new Feature: scenario_mandatory_name, ', 
														   'scenario_mandatory_step_definition, scenario_mandatory_executionBlock' 
		 ]
]
