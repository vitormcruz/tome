Class {
	#name : #TomeSequenceableCollectionTest,
	#superclass : #TestCase,
	#category : #'Tome-Tests'
}

{ #category : #tests }
TomeSequenceableCollectionTest >> test_asFormatParametersOf_empty [

	self should: [ (#( name  age ) asFormatParametersOf: #()) ] 
		  raise: Error 
		  withExceptionDo: [ :err | 
		    self assert: err messageText equals: 'There should be 2 parameters but found 0'
  		  ].
]

{ #category : #tests }
TomeSequenceableCollectionTest >> test_asFormatParametersOf_nil [

	self should: [ (#( name  age ) asFormatParametersOf: nil) ] 
		  raise: Error 
		  withExceptionDo: [ :err | 
		    self assert: err messageText equals: 'There should be 2 parameters but found 0'
  		  ].
]

{ #category : #tests }
TomeSequenceableCollectionTest >> test_asFormatParametersOf_parameter_size_equals_required [

	self assertCollection: (#( name  age ) asFormatParametersOf: #('Roger' 33))  
 		  equals: { 'name' -> 'Roger'. 'age' -> 33} asDictionary
]

{ #category : #tests }
TomeSequenceableCollectionTest >> test_asFormatParametersOf_parameter_size_less_than_required [

	self should: [ (#( name  age ) asFormatParametersOf: #('Roger')) ] 
		  raise: Error 
		  withExceptionDo: [ :err | 
		    self assert: err messageText equals: 'There should be 2 parameters but found 1'
  		  ].
]

{ #category : #tests }
TomeSequenceableCollectionTest >> test_asFormatParametersOf_parameter_size_more_than_required [

	self should: [ (#( name  age ) asFormatParametersOf: #('Roger' 33 'extra param')) ] 
		  raise: Error 
		  withExceptionDo: [ :err | 
		    self assert: err messageText equals: 'There should be 2 parameters but found 3'
  		  ].
]
