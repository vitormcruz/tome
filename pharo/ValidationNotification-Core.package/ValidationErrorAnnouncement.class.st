Class {
	#name : #ValidationErrorAnnouncement,
	#superclass : #ValidationAnnouncement,
	#instVars : [
		'error',
		'issuer',
		'context'
	],
	#category : 'ValidationNotification-Core-ValidationNotification-Core'
}

{ #category : #'instance creation' }
ValidationErrorAnnouncement class >> newForError: aString issuedBy: anObject withinContext: context [

	^ self new forError: aString issuedBy: anObject withinContext: context.
]

{ #category : #notification }
ValidationErrorAnnouncement >> fillDictionary: aDictionary [

	aDictionary at: error put: ({'issuer'->issuer} asDictionary | (context ifNil: Dictionary empty)).
]

{ #category : #'instance creation' }
ValidationErrorAnnouncement >> forError: aString issuedBy: anObject withinContext: aContext [

	error := aString.
	issuer := anObject.
	context := aContext.
	
]
