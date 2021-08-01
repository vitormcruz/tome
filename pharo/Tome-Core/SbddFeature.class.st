Class {
	#name : #SbddFeature,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'scenarioBuilderMethod',
		'exampleIndex'
	],
	#category : 'Tome-Core'
}

{ #category : #private }
SbddFeature class >> isAbstract [

	^ self name = #SbddFeature 
]

{ #category : #'building suites' }
SbddFeature class >> myScenarios [

	^ self chain methods;
				  	 select: [ :method | (method pragmas collect: #selector) includes: 'scenario' ]; 
					 inject: OrderedCollection new into: [ :finalCollection :scenarioBuilderMethod | 
						finalCollection addAll: ((1 to: ((scenarioBuilderMethod valueWithReceiver: self new arguments: #()) size )) collect: [ :exampleIndex | {#scenarioBuilderMethod -> scenarioBuilderMethod selector. 
					  #exampleIndex -> exampleIndex}]);
						yourself 
						 
					 ].
]

{ #category : #'building suites' }
SbddFeature class >> testParameters [

	^ self myScenarios inject: ParametrizedTestMatrix new 
						    into: [ :testMatrix :aCase | testMatrix addCase: aCase ]

]

{ #category : #accessing }
SbddFeature >> exampleIndex [
	^ exampleIndex
]

{ #category : #accessing }
SbddFeature >> exampleIndex: anObject [
	exampleIndex := anObject
]

{ #category : #'scenario builder' }
SbddFeature >> scenario: aString def: aStringDefinition run: aBlock [

	^ {SbddScenario withName: aString 
	 	            definition: aStringDefinition 
				      executionBlock: aBlock}

]

{ #category : #accessing }
SbddFeature >> scenarioBuilderMethod [
	^ scenarioBuilderMethod
]

{ #category : #accessing }
SbddFeature >> scenarioBuilderMethod: anObject [
	scenarioBuilderMethod := anObject
]

{ #category : #'scenario builder' }
SbddFeature >> scenarioOutline: aString def: aStringDescription examples: examples run: aBlock [

	^ examples chain 
				  collect: [ :example | 
				  		self scenario: aString 
						     def: (aStringDescription format: example)
						     run: aBlock
				  ]; 
				  flattened.
]

{ #category : #running }
SbddFeature >> setUp [
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
SbddFeature >> testScenario [

	^ ((self perform: scenarioBuilderMethod) at: exampleIndex) run.


]
