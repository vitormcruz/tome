Class {
	#name : #TomeFeatureHtmlConsolidatedTestHandler,
	#superclass : #CommandLineHandler,
	#classInstVars : [
		'active'
	],
	#category : #'Tome-Tools-WebApp-SUnit-Reporting'
}

{ #category : #accessing }
TomeFeatureHtmlConsolidatedTestHandler class >> active [

	^ active
]

{ #category : #accessing }
TomeFeatureHtmlConsolidatedTestHandler class >> active: aBoolean [

	active := aBoolean.
	active ifTrue: [ TomeFeatureSuite addReporting: (TomeFuelReportingChain new reportingFolder: 'target/specificationExecFuel'). ]
]

{ #category : #accessing }
TomeFeatureHtmlConsolidatedTestHandler class >> commandName [

	^ 'test'.
]

{ #category : #'class initialization' }
TomeFeatureHtmlConsolidatedTestHandler class >> initialize [ 

	active := false.
]

{ #category : #'handler selection' }
TomeFeatureHtmlConsolidatedTestHandler class >> isResponsibleFor: aCommandLineArguments [

	<todo: 'add tests'>
	
	active ifFalse: [ ^ false ].
	^ aCommandLineArguments includesSubCommand: self commandName
]

{ #category : #'handler selection' }
TomeFeatureHtmlConsolidatedTestHandler class >> priority [
	^ 10
]

{ #category : #activation }
TomeFeatureHtmlConsolidatedTestHandler >> activate [

	self traceCr: '>>>>>>>>> Passou!!!'

]
