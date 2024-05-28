Class {
	#name : #TomeDummyFeature,
	#superclass : #TomeFeature,
	#category : #'Tome-Tests'
}

{ #category : #private }
TomeDummyFeature class >> isAbstract [

	^ true.
]

{ #category : #scenarios }
TomeDummyFeature >> scenario1 [

	<scenario>
	
	^ self scenario: '' def: '' run: [  ]
]

{ #category : #scenarios }
TomeDummyFeature >> scenario2 [

	<scenario>
	
	^ self scenario: '' def: '' run: [  ]
]

{ #category : #scenarios }
TomeDummyFeature >> scenarioOutline1 [

	<scenario>
	
	^ self scenarioOutline: '' def: '' 
	       examples: #() asHeaderFor - #()  "1 example"
	       run: [  ]
]

{ #category : #scenarios }
TomeDummyFeature >> scenarioOutline2 [

	<scenario>
	
	^ self scenarioOutline: '' def: '' 
	       examples: #() asHeaderFor - #() -#() "2 examples"
	       run: [  ]
]

{ #category : #scenarios }
TomeDummyFeature >> scenarioOutline3 [

	<scenario>
	
	^ self scenarioOutline: '' def: '' 
	       examples: #() asHeaderFor - #() -#() -#() "3 examples"
	       run: [  ]
]
