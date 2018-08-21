"
I autoregister me as a listener for errors and simply store all the errors issued.
"
Class {
	#name : #SimpleValidationObserver,
	#superclass : #Object,
	#traits : 'TValidationObserver @ {#validationInitialize->#initialize}',
	#classTraits : 'TValidationObserver classTrait',
	#instVars : [
		'errors'
	],
	#category : 'ValidationNotification-Core'
}

{ #category : #accessing }
SimpleValidationObserver >> errors [

	^ Dictionary newFrom: errors.
]

{ #category : #'as yet unclassified' }
SimpleValidationObserver >> handleAnnouncer: announcement [

	announcement fillDictionary: errors.
]

{ #category : #initialization }
SimpleValidationObserver >> initialize [

	self validationInitialize.
	errors := Dictionary new.
]

{ #category : #testing }
SimpleValidationObserver >> isSuccessful [

	^ errors isEmpty.
]
