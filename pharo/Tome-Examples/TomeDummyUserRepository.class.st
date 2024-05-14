Class {
	#name : #TomeDummyUserRepository,
	#superclass : #OrderedCollection,
	#category : #'Tome-Examples'
}

{ #category : #adding }
TomeDummyUserRepository >> add: aNewUser [

	(self anySatisfy: [ :user | user cpf = aNewUser cpf ])
		ifTrue: [ TomeExampleError signal: 'A User with this CPF number was already inserted!!' ].
		
	(aNewUser age < 18)	
		ifTrue: [ TomeExampleError signal: 'Minor users cannot be registered.'  ].
		
	super add: aNewUser
]
