Class {
	#name : #FMDescriptionBuilderTest,
	#superclass : #TestCase,
	#category : 'FluentMagritte-Tests'
}

{ #category : #tests }
FMDescriptionBuilderTest >> testCreatingDescriptions [
	| examples |
	
	examples := { 
					  Class -> MAClassDescription.
					  Collection -> MAContainer. 
				  	  String -> MAStringDescription.
					  Boolean -> MABooleanDescription.
					  Color -> MAColorDescription.
					  File -> MAFileDescription.
					  "Directory -> MADirectoryDescription. What to do??"
					  DateAndTime -> MADateAndTimeDescription.
					  Date -> MADateDescription.
					  Duration -> MADurationDescription.
					  Number -> MANumberDescription.
					  Time -> MATimeDescription.
					  "TimeStamp -> MATimeStampDescription. What to do??"
					} asDictionary.

	examples keysAndValuesDo: [ :type :descType |
			self assert: ((#anAccessor isA: type) isKindOf: descType). 
	].
]
