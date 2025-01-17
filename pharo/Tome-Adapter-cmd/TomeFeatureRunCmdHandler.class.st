"
I am a Command Line Handler for Feature Execution. Usage:

    pharo featureRun <list of packages>
	
<list of packages> can be literal packages names ou regex, so, for example:

    pharo featureRun PackageA PackageB.*

This will tell Tome to look for features on PackageA and in any package that
maches the PackageB.* regex.
"
Class {
	#name : #TomeFeatureRunCmdHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'debugTranscript',
		'quit'
	],
	#category : #'Tome-Adapter-cmd'
}

{ #category : #accessing }
TomeFeatureRunCmdHandler class >> commandName [

	^ 'featureRun'
]

{ #category : #default }
TomeFeatureRunCmdHandler class >> defaultDebubTranscript [

	^ Transcript.
]

{ #category : #accessing }
TomeFeatureRunCmdHandler class >> description [

	^ 'A cmd feature runner'
]

{ #category : #activation }
TomeFeatureRunCmdHandler >> activate [

	| features packagesMatched featureExecResult |
	
	self hasArguments ifFalse: [ ^ self traceCr: 'You must provide a list of packages (may be a regex) with features to run' ].

	packagesMatched := self matchPackagesUsingArgs: self arguments.
	packagesMatched ifEmpty: [ ^ self traceCr: 'No packages found' ].

	features := self getFeaturesFrom: packagesMatched.
	features ifEmpty: [ ^ self traceCr: 'No features found inside any of the provided packages: ', (packagesMatched reduce: [ :a :b | a , ', ' , b ]) ].

	features do: [ :feature |
		featureExecResult := feature buildSuite run.
		self traceCr: 	feature name , ' found. Result: ' , featureExecResult asString 
	].

	Smalltalk snapshot: false andQuit: quit
]

{ #category : #debugging }
TomeFeatureRunCmdHandler >> debugTranscript [

	^ debugTranscript.
]

{ #category : #private }
TomeFeatureRunCmdHandler >> debugTranscript: aTranscript [

	debugTranscript := aTranscript.
]

{ #category : #activation }
TomeFeatureRunCmdHandler >> getFeaturesFrom: packagesMatched [

	^ (packagesMatched collect: [ :package |
		   package asPackage classes select: [ :class |
			   class isFeature & class isAbstract not ] ]) flattened
]

{ #category : #initialization }
TomeFeatureRunCmdHandler >> initialize [

	quit := true.
	debugTranscript := self class defaultDebubTranscript.
]

{ #category : #activation }
TomeFeatureRunCmdHandler >> matchPackagesUsingArgs: aCollection [

	^ RPackage organizer packageNames select: [ :packageName | aCollection anySatisfy: [ :arg | arg matchRobust: packageName ] ].
]

{ #category : #utilities }
TomeFeatureRunCmdHandler >> quit [ 

	^ quit
]

{ #category : #utilities }
TomeFeatureRunCmdHandler >> quit: aBoolean [

	quit := aBoolean.
]

{ #category : #'default actions' }
TomeFeatureRunCmdHandler >> traceCr: anObject [

	self debugTranscript show: anObject.
	self debugTranscript cr.
]
