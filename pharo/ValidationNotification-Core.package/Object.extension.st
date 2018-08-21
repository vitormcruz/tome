Extension { #name : #Object }

{ #category : #'*ValidationNotification-Core' }
Object >> complyMandatoryObligation: aString withinContext: aDictionary [
]

{ #category : #'*ValidationNotification-Core' }
Object >> executeValidationNamed: validationName with: validationBlock [
]

{ #category : #'*ValidationNotification-Core' }
Object >> executeValidationNamed: validationName withinContext: aDictionary with: validationBlock [
]

{ #category : #'*ValidationNotification-Core' }
Object >> issueError: aString [

	^ self issueError: aString withinContext: nil
]

{ #category : #'*ValidationNotification-Core' }
Object >> issueError: aString withinContext: aDictionary [

	ValidationAnnouncement announcer announce: (ValidationErrorAnnouncement newForError: aString issuedBy: self withinContext: nil).
]

{ #category : #'*ValidationNotification-Core' }
Object >> issueMandatoryObligation: aString withinContext: aDictionary [
]
