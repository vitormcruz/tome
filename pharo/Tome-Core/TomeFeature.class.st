"
I am used to instantiate Features much like `TestCase` is used to instantiate tests. Every Feature may be composed by a name, a description and a list of scenarios that can be executed by `#'SUnit-Core'` just like any other test. Each scenario is composed by a summary and it's definition. It is recommended to implement a scenario as an example to build a solid Executable Specification by Example. The BDD scenario definition can be written any way you like it, but it is suggested to use the well know format:
	- Given <something>
	- When <an action>
	- Then <a result>
	
See `#'Tome-Tests-Examples'` 

##Usage

### 1) As a BDD Framework for Developers

I can be to implement higher level behavior driven tests from devs to devs where the client isn't participative (API development, non-agile or when he don't care), that way you don't need to compromise with all the complexity of keeping external documents linked to the code while still being able to produce a human readable Specification by Example to serve as basis of the code unedrstanding.

To create Features you must sublass me and implement scenario methods like this:

```
Add_a_New_User

	<scenario>

	^ self scenario: 'Add a new User'
      		      def: 'Given a new user named ""Sofia""
        			      When I try to register her as a user
           	         Then she is registery ""successfully""'
         		   run: [ :userName :result | 
						userRepository add: (TomeDummyUser new name: userName).
						self assert: result equals: 'successfully'
					].

```

The method can be named anyway wanted, but it must be annotated with _scenario_ pragma in order to be recognized, setUp and tearDown methods can be used normally. The scenario summary briefly describes what the scenario is testing. The definition contains the full test description where everything enclosed by '""' will be passed as argument, in the finded order, to the block passed in the 'run:' parameter. This block is, then, responsible to tie scenario definition to it's execution. It is recommended to use as many parameters as possible so that the actual human readable scenario influece the block execution.

Besides a single scenario, it is possible to create a scenario outline that derives as many scenarios as examples are provided. For example, the following scenario outline will create three scenarios based on the provided examples:

```
User_Must_Be_Major_Feature

	<scenario>

	^ self scenarioOutline: 'User must be Major'
      		       	   def: 'Given that John has ""{a number}"" years old
        			            When I try to register him as a User
           			         Then the result is: ""{result}""'
                   
                 examples: #(  'a number'   'result'  ) asHeaderFor 
                	 		  - #(    12         fail    )
                 			  - #(    18         sucess   )
                 			  - #(    25         sucess   )
  
	            		   run: [ :aNumber :resultExpected |
 	           		 	  self assert: (aNumber >= 18 ifTrue: [ 'sucess' ] ifFalse: [ 'fail' ])
	 	            		  		 equals: resultExpected.
    		   			   ].
```

Note that the header of the example table is used as a variable on the step definition through the use of '{}'. So, _{a number}_ will be replaced by 12 in the first example, 18 on the second and by 25 on the last one.


### 2) As full Executable Specification By Example Framework

TO DO
"
Class {
	#name : #TomeFeature,
	#superclass : #TestCase,
	#instVars : [
		'scenarioToRun'
	],
	#classVars : [
		'VIRTUAL_SCENARIO_INDEX_SEPARATOR'
	],
	#category : #'Tome-Core'
}

{ #category : #constant }
TomeFeature class >> VIRTUAL_SCENARIO_INDEX_SEPARATOR [

	^ VIRTUAL_SCENARIO_INDEX_SEPARATOR
]

{ #category : #documentation }
TomeFeature class >> buildMicroDownUsing: aBuilder withComment: aString [

	Class buildMicroDownUsing: aBuilder withComment: aString
]

{ #category : #'building suites' }
TomeFeature class >> buildSuite [

	| suite |
	^self isAbstract
		ifTrue:
			[suite := self suiteClass forClass: self.
			self allSubclasses
				do: [:each | each isAbstract ifFalse: [suite addTest: each buildSuiteFromSelectors]].
			suite]
		ifFalse: [self buildSuiteFromSelectors]
]

{ #category : #'building suites' }
TomeFeature class >> buildSuiteFromMethods: testMethods [

	^testMethods
		inject: (self suiteClass forClass: self)
		into: [:suite :selector |
			suite
				addTest: (self selector: selector);
				yourself]
]

{ #category : #infos }
TomeFeature class >> featureName [

	^ self name
]

{ #category : #'class initialization' }
TomeFeature class >> initialize [

	VIRTUAL_SCENARIO_INDEX_SEPARATOR := '__index__'
]

{ #category : #private }
TomeFeature class >> isAbstract [

	^ self name = #TomeFeature
]

{ #category : #infos }
TomeFeature class >> isFeature [

	^ true
]

{ #category : #'building suites' }
TomeFeature class >> scenarioPragmedMethods [

	^ self methods select: [ :method | (method pragmas collect: #selector) includes: 'scenario' ]
]

{ #category : #factory }
TomeFeature class >> suiteClass [

	^ TomeFeatureSuite.
]

{ #category : #accessing }
TomeFeature class >> testSelectors [

	| instanceOfMe |
	
	instanceOfMe := self new.
	
	^ (self scenarioPragmedMethods collect: [ :scenarioMethod | 
		| qtdScenarios |
		
		qtdScenarios := (scenarioMethod valueWithReceiver: instanceOfMe arguments: #()) size.
		(1 to: qtdScenarios) collect: [ :index | scenarioMethod selector, VIRTUAL_SCENARIO_INDEX_SEPARATOR , index asString ]
	]) flattened.
]

{ #category : #'reflective operations' }
TomeFeature >> doesNotUnderstand: aMessage [

	"Features Scenarios are Virtual Tests, i.e., methods are created dynamically dependending on the 
	scenarios definition — they actually do not exists. The testSelector selector defines the name of 
	the message for the virtual scenario, and scenarioToRun stores the sceario itself, then the DNU is 
	just used to dynamically link the message resolve to the scenario running — for a TestCase point 
	of view, it works just as expected."
	
	(aMessage selector ~= testSelector) ifTrue: [ super doesNotUnderstand: aMessage ].
	scenarioToRun run.

]

{ #category : #private }
TomeFeature >> instanceVariablesToKeep [

	^ super instanceVariablesToKeep , #( 'scenarioToRun' )
]

{ #category : #printing }
TomeFeature >> printOn: aStream [

	scenarioToRun printOn: aStream.
]

{ #category : #'scenario builder' }
TomeFeature >> scenario: aString def: aStringDefinition run: aBlock [

	"Create a new scenario to be build by a block. Calling the block #value actually 
	creates a new scenario. Return a collection since all method test calls are indexed 
	based, see #doesNotUnderstand: and #scenarioDerivedFromSelector: for more details about this."
	
	^ { [ TomeScenario withName: aString 
	                   definition: aStringDefinition 
	                   executionBlock: aBlock ] }
]

{ #category : #'scenario builder' }
TomeFeature >> scenarioDerivedFromSelector: aMessageSelector [

	| splitedMessage scenarioBuilderMethod scenarios scenarioIndex |
	
	splitedMessage := aMessageSelector splitOn: VIRTUAL_SCENARIO_INDEX_SEPARATOR.
	splitedMessage size ~= 2 ifTrue: [	Error signal: 'Cannot find the scenario with the povided selector' ].

	scenarioBuilderMethod := self class compiledMethodAt: (splitedMessage at: 1) asSymbol.
	scenarios := scenarioBuilderMethod valueWithReceiver: self arguments: #(  ).
	
	scenarioIndex := (splitedMessage at: 2) asNumber.
	^ (scenarios at: scenarioIndex) value
]

{ #category : #'scenario builder' }
TomeFeature >> scenarioOutline: aString def: aStringDescription examples: examples run: aBlock [

	"Prepare N scenarios to be builded based on the examples provided. See #scenario:def:run for more details"

	^ (examples collect: [ :example | 
				  		(self scenario: aString 
						     def: (example applyAsExampleTo: aStringDescription)
						     run: aBlock) 
				  ]) flattened.
]

{ #category : #accessing }
TomeFeature >> scenarioToRun [

	^ scenarioToRun
]

{ #category : #private }
TomeFeature >> setTestSelector: aSymbol [

	testSelector := aSymbol.
	scenarioToRun := self scenarioDerivedFromSelector: aSymbol
]

{ #category : #'scenario builder' }
TomeFeature >> when: aBlock [

	"Returns a WhenClause created in the context of the scenarioToRun (TomeScenario) execution"

	^ scenarioToRun when: aBlock.
]
