"
ValidationObserverTrait
"
Trait {
	#name : #TValidationObserver,
	#category : 'ValidationNotification-Core'
}

{ #category : #'error-notification' }
TValidationObserver >> compliedMandatoryObligation: mandatoryValidationName from: subject withinContext: aDictionary [

	self subclassResponsibility.
]

{ #category : #accessing }
TValidationObserver >> errors [

	self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
TValidationObserver >> handleAnnouncer: announcement [

	self subclassResponsibility. 
]

{ #category : #initialization }
TValidationObserver >> initialize [

	super initialize.
	ValidationAnnouncement addValidationObserver: self.


]

{ #category : #testing }
TValidationObserver >> isSuccessful [

	self subclassResponsibility.
]

{ #category : #'error-notification' }
TValidationObserver >> mandatoryObligation: mandatoryValidationName issuedFrom: subject withinContext: aDictionary [

	self subclassResponsibility.
]

{ #category : #'error-notification' }
TValidationObserver >> validationFinished [

	self subclassResponsibility.
]

{ #category : #'error-notification' }
TValidationObserver >> validationStarted: validationName [

	self subclassResponsibility.
]
