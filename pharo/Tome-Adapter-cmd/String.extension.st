Extension { #name : #String }

{ #category : #'*Tome-Adapter-cmd' }
String >> matchRobust: aString [

	"Matches a regex or literal if I am not conversible to regex, 
	therefore avoiding raising an error"

	[ ((self asRegex) matches: aString) ifTrue: [ ^ true ] ] 
			on: Error 
			do: [ self = aString ifTrue: [ ^ true ] ].

	^ false.
]
