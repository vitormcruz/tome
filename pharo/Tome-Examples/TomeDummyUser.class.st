Class {
	#name : #TomeDummyUser,
	#superclass : #Object,
	#instVars : [
		'name',
		'cpf',
		'monthlyWage',
		'age'
	],
	#category : #'Tome-Examples'
}

{ #category : #accessing }
TomeDummyUser >> age [

	^ age
]

{ #category : #accessing }
TomeDummyUser >> age: anObject [

	age := anObject
]

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

{ #category : #accessing }
TomeDummyUser >> yearlyWage [

	^ monthlyWage * 12.
]
