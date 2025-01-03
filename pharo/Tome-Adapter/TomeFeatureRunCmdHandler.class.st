Class {
	#name : #TomeFeatureRunCmdHandler,
	#superclass : #CommandLineHandler,
	#category : #'Tome-Adapter-cmd'
}

{ #category : #accessing }
TomeFeatureRunCmdHandler class >> commandName [

	^ 'featureRun'
]

{ #category : #accessing }
TomeFeatureRunCmdHandler class >> description [

	^ 'A cmd feature runner'
]

{ #category : #activation }
TomeFeatureRunCmdHandler >> activate [

	| features regexArgs literalArgs packagesMatched |
	
	self hasArguments ifFalse: [ ^ self traceCr: 'You must provide a list of packages (maybe a regex) with features to run' ].
	
	regexArgs := Set new.
	literalArgs := Set new.
	self arguments do: [ :arg | 
		[ regexArgs add: (arg asRegex) ] 
			on: Error 
			do: [ literalArgs add: arg ] 
	].
	
	packagesMatched := RPackage organizer packageNames select: [ :packageName | 
		 (literalArgs includes: packageName) | (regexArgs anySatisfy: [ :regex | regex matches: packageName])
	].

	features := (packagesMatched collect: [ :package | package asPackage classes select: [ :class | class isFeature & class isAbstract not] ]) flattened.
	features do: [ :feature | feature buildSuite run ].
	
	Smalltalk snapshot: false andQuit: true.
]
