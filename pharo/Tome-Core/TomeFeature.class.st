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
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'scenarioBuilderMethod',
		'exampleIndex'
	],
	#category : #'Tome-Core'
}

{ #category : #private }
TomeFeature class >> isAbstract [

	^ self name = #TomeFeature 
]

{ #category : #'building suites' }
TomeFeature class >> myScenarios [

	^ self chain methods;
				  	 select: [ :method | (method pragmas collect: #selector) includes: 'scenario' ]; 
					 inject: OrderedCollection new 
					 into: [ :scenarios :scenarioBuilderMethod | 
					     scenarios addAll: ((1 to: ((scenarioBuilderMethod valueWithReceiver: self new arguments: #()) size )) 
														collect: [ :exampleIndex | {#scenarioBuilderMethod -> scenarioBuilderMethod selector. 
																						   #exampleIndex -> exampleIndex}
														]);
						  yourself 
					 ].
]

{ #category : #'building suites' }
TomeFeature class >> testParameters [

   | myScenarios |

   myScenarios := self myScenarios.

	myScenarios ifEmpty: [ Error signal: 'No scenarios found. The feature classe must have at least one method annotated with the <senario> pragma' ].

   ^ myScenarios inject: ParametrizedTestMatrix new
			        into: [ :testMatrix :aCase | testMatrix addCase: aCase ]
]

{ #category : #accessing }
TomeFeature >> exampleIndex [
	^ exampleIndex
]

{ #category : #accessing }
TomeFeature >> exampleIndex: anObject [
	exampleIndex := anObject
]

{ #category : #'scenario builder' }
TomeFeature >> scenario: aString def: aStringDefinition run: aBlock [

	^ {TomeScenario withName: aString 
	 	            definition: aStringDefinition 
				      executionBlock: aBlock}

]

{ #category : #accessing }
TomeFeature >> scenarioBuilderMethod [
	^ scenarioBuilderMethod
]

{ #category : #accessing }
TomeFeature >> scenarioBuilderMethod: anObject [
	scenarioBuilderMethod := anObject
]

{ #category : #'scenario builder' }
TomeFeature >> scenarioOutline: aString def: aStringDescription examples: examples run: aBlock [

	^ examples chain 
				  collect: [ :example | 
				  		self scenario: aString 
						     def: (example applyAsExampleTo: aStringDescription)
						     run: aBlock
				  ]; 
				  flattened.
]

{ #category : #running }
TomeFeature >> setUp [
	<deprecated:  'Fix for parametrized tests. Wait until fix in the image.'>
	
	self initialize.
	self parametersToUse do: [ :aParameter | aParameter applyTo: self ].
	
	"If I am executed without calling buildSuite in the class. I will use the first set of options.
	This is a workaround to work when running from Calypso"
	(self parametersToUse isEmpty and: [self class testParameters expandMatrix isNotEmpty]) 
		ifTrue: [ 
				self class 
						testParameters expandMatrix first 
						do: [ :aParameter | aParameter applyTo: self ] ]
]

{ #category : #'parameterized tests' }
TomeFeature >> testScenario [

	^ ((self perform: scenarioBuilderMethod) at: exampleIndex) run.


]
