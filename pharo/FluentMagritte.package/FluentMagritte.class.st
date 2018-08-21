Class {
	#name : #FluentMagritte,
	#superclass : #Object,
	#category : 'FluentMagritte-Tests'
}

{ #category : #'as yet unclassified' }
FluentMagritte >> objectDescription [
	<magritteContainer>

^ { 
  (#street isA: String) label: 'Street'; priority: 100. 
  (#ggggg isA: String) label: 'gggg'; priority: 100. 
}.
]
