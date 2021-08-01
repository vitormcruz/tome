Class {
	#name : #TomeDummyUser,
	#superclass : #Object,
	#instVars : [
		'name',
		'cpf'
	],
	#category : #'Tome-Tests-Examples'
}

{ #category : #accessing }
TomeDummyUser >> cpf [
	^ cpf
]

{ #category : #accessing }
TomeDummyUser >> cpf: anObject [
	cpf := anObject
]

{ #category : #accessing }
TomeDummyUser >> name [
	^ name
]

{ #category : #accessing }
TomeDummyUser >> name: anObject [
	name := anObject
]
