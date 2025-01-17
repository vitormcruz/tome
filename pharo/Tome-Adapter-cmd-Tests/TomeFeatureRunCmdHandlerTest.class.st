"
A TomeFeatureRunCmdHandlerTest is a test class for testing the behavior of TomeFeatureRunCmdHandler
"
Class {
	#name : #TomeFeatureRunCmdHandlerTest,
	#superclass : #TestCase,
	#instVars : [
		'debugList'
	],
	#category : #'Tome-Adapter-cmd-Tests'
}

{ #category : #running }
TomeFeatureRunCmdHandlerTest >> cmdHandleWithArgs: args [

	| transcriptMock |
	
	transcriptMock := Mock new.
	transcriptMock stub show: [ :arg | debugList add: arg ].
	transcriptMock stub cr. 
	^ (TomeFeatureRunCmdHandler commandLine: (CommandLineArguments withArguments: args)) 
			quit: false; 
			debugTranscript: transcriptMock.
]

{ #category : #tests }
TomeFeatureRunCmdHandlerTest >> packagesFoundFrom: error [

	^ (((error
		     copyReplaceAll:
		     'No features found inside any of the provided packages: '
		     with: '') splitOn: ',') collect: #trim) asSet
]

{ #category : #running }
TomeFeatureRunCmdHandlerTest >> setUp [

	super setUp.
	debugList := OrderedCollection new.



]

{ #category : #running }
TomeFeatureRunCmdHandlerTest >> tearDown [

	debugList removeAll.
]

{ #category : #tests }
TomeFeatureRunCmdHandlerTest >> test_activate_no_arguments [


	(self cmdHandleWithArgs: { }) activate.
	
	self 
		assertCollection: debugList 
		hasSameElements: { 'You must provide a list of packages (may be a regex) with features to run' }
]

{ #category : #tests }
TomeFeatureRunCmdHandlerTest >> test_no_packages_found_using_literal_arg [


	(self cmdHandleWithArgs: { 'XXDSS' }) activate.
	
	self 
		assertCollection: debugList 
		hasSameElements: { 'No packages found' }
]

{ #category : #tests }
TomeFeatureRunCmdHandlerTest >> test_no_packages_found_using_regex_arg [


	(self cmdHandleWithArgs: { 'XXDSS.*' }) activate.
	
	self 
		assertCollection: debugList 
		hasSameElements: { 'No packages found' }
]

{ #category : #tests }
TomeFeatureRunCmdHandlerTest >> test_no_packages_with_features_found_using_literal_arg [


	(self cmdHandleWithArgs: { 'Tome-Core' }) activate.
	
	self 
		assertCollection: debugList 
		hasSameElements: { 'No features found inside any of the provided packages: Tome-Core' }
]

{ #category : #tests }
TomeFeatureRunCmdHandlerTest >> test_no_packages_with_features_found_using_regex_arg [

	| errorMessage |
	(self cmdHandleWithArgs: { 'Tome-C.*' }) activate.

	self assert: debugList size equals: 1.
	errorMessage := debugList at: 1.

	self assert: (errorMessage beginsWith: 'No features found inside any of the provided packages: ').
	self	assertCollection: (self packagesFoundFrom: errorMessage)
			hasSameElements: #( 'Tome-Core' 'Tome-Config' )
]

{ #category : #tests }
TomeFeatureRunCmdHandlerTest >> test_packages_with_testcases_and_features_passing_and_failing_using_multiple_args [

	(self cmdHandleWithArgs: { 'Tome-C.*'. 'Tome-Adapter-cmd-Tests'. 'Tome-Adapter-cmd-Tests-DummyFeatures'}) activate.

	self assertCollection: debugList
			hasSameElements: 
				{	'DummyFeature1 found. Result: 1 ran, 1 passed, 0 skipped, 0 expected failures, 0 failures, 0 errors, 0 passed unexpected'.
					'DummyFeature2 found. Result: 1 ran, 0 passed, 0 skipped, 0 expected failures, 1 failure, 0 errors, 0 passed unexpected'.
					'DummyFeature3 found. Result: 1 ran, 0 passed, 0 skipped, 0 expected failures, 0 failures, 1 error, 0 passed unexpected'.
					'DummyFeature4 found. Result: 9 ran, 3 passed, 0 skipped, 0 expected failures, 3 failures, 3 errors, 0 passed unexpected'.
				} asSet
]

{ #category : #tests }
TomeFeatureRunCmdHandlerTest >> test_packages_with_testcases_but_no_features_using_multiple_args [

	| errorMesage |
	(self cmdHandleWithArgs: { 'Tome-C.*'. 'Tome-Adapter-cmd-Tests'}) activate.

	self assert: debugList size equals: 1.
	errorMesage := debugList at: 1.

	self assert: (errorMesage beginsWith: 'No features found inside any of the provided packages: ').
	self	assertCollection: (self packagesFoundFrom: errorMesage)
			hasSameElements: #( 'Tome-Core' 'Tome-Config' 'Tome-Adapter-cmd-Tests')
]
