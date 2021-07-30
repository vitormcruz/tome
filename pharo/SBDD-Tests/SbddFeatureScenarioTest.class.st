Class {
	#name : #SbddFeatureScenarioTest,
	#superclass : #TestCase,
	#category : 'SBDD-Tests'
}

{ #category : #'tests - scenarios execution' }
SbddFeatureScenarioTest >> test_create_scenario_without_mandatory_params [

	self should: [ (SbddScenario withName: nil definition: nil executionBlock: nil) run ] 
		  raise: Error 
		  withExceptionDo: [ :ex | self assert: ex messageText
												 equals: 'Following errors found while creating a new Feature: scenario_mandatory_name, ', 
														   'scenario_mandatory_step_definition, scenario_mandatory_executionBlock' 
		 ]
]
