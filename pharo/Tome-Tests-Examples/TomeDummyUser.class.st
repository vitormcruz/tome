Class {
	#name : #TomeDummyUser,
	#superclass : #Object,
	#instVars : [
		'name',
		'cpf',
		'monthlyWage'
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
TomeDummyUser >> monthlyWage [

	^ monthlyWage
]

{ #category : #accessing }
TomeDummyUser >> monthlyWage: anObject [

	monthlyWage := anObject
]

{ #category : #accessing }
TomeDummyUser >> name [
	^ name
]

{ #category : #accessing }
TomeDummyUser >> name: anObject [
	name := anObject
]

{ #category : #'as yet unclassified' }
TomeDummyUser >> yearlyWage [

	^ monthlyWage * 12.
]
