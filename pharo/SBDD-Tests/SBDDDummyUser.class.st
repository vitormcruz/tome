Class {
	#name : #SBDDDummyUser,
	#superclass : #Object,
	#instVars : [
		'name',
		'cpf'
	],
	#category : 'SBDD-Tests-Examples'
}

{ #category : #accessing }
SBDDDummyUser >> cpf [
	^ cpf
]

{ #category : #accessing }
SBDDDummyUser >> cpf: anObject [
	cpf := anObject
]

{ #category : #accessing }
SBDDDummyUser >> name [
	^ name
]

{ #category : #accessing }
SBDDDummyUser >> name: anObject [
	name := anObject
]
