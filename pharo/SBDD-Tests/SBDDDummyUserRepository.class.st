Class {
	#name : #SBDDDummyUserRepository,
	#superclass : #OrderedCollection,
	#category : 'SBDD-Tests-Examples'
}

{ #category : #adding }
SBDDDummyUserRepository >> add: aNewUser [

	(self anySatisfy: [ :user | user cpf = aNewUser cpf ])
		ifTrue: [ Error signal: 'A User with this CPF number was already inserted!!' ].
		
	super add: aNewUser
]
