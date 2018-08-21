Class {
	#name : #ValidationAnnouncement,
	#superclass : #Announcement,
	#classInstVars : [
		'localAnnouncerFechBlock'
	],
	#category : 'ValidationNotification-Core'
}

{ #category : #adding }
ValidationAnnouncement class >> addValidationObserver: validationObserver [

	self subclasses do: [ :subclass | 
		self announcer weak when: subclass send: #handleAnnouncer: to: validationObserver.
	].
]

{ #category : #accesing }
ValidationAnnouncement class >> announcer [
	^ localAnnouncerFechBlock value value.
]

{ #category : #initialization }
ValidationAnnouncement class >> initialize [

	localAnnouncerFechBlock := [ ProcessLocalObservers value ifNil: [ ProcessLocalObservers value: Announcer new ] ].
]

{ #category : #accessing }
ValidationAnnouncement class >> observers [

	^ Set newFrom: ((localAnnouncerFechBlock value value subscriptions subscriptions) collect: #subscriber).
]

{ #category : #removing }
ValidationAnnouncement class >> removeAllObservers [
]

{ #category : #removing }
ValidationAnnouncement class >> removeObserver: validationObserver [
]

{ #category : #notification }
ValidationAnnouncement >> fillDictionary: aDictionary [

	self subclassResponsibility.
]
