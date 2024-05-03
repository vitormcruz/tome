Class {
	#name : #TomeDelegatedParamTest,
	#superclass : #TestCase,
	#category : #'Tome-Tests'
}

{ #category : #tests }
TomeDelegatedParamTest >> test_newForDef_number [

	self assert: (TomeDelegatedParam newForDef: '10') 
	     equals: 10.
]

{ #category : #tests }
TomeDelegatedParamTest >> test_newForDef_string [

	self assert: (TomeDelegatedParam newForDef: 'some string') 
	     equals: 'some string'.
]
