Class {
	#name : #TomeFeatureAssertion,
	#superclass : #TestAsserter,
	#instVars : [
		'assertionDef'
	],
	#category : #'Tome-Core'
}

{ #category : #'instance creation' }
TomeFeatureAssertion class >> buildWithDef: aStringDefinition [

	^ self new assertionDefinition: aStringDefinition.
]

{ #category : #accessing }
TomeFeatureAssertion >> assertionDefinition: aStringAssertionDef [

    assertionDef := aStringAssertionDef    
]

{ #category : #tests }
TomeFeatureAssertion >> testFailFor: aString [

    "Verify if the assertion fails for a string before doing the actual assertion. 
     It is usefull to validate the state of the system before the tested action execution"

     | assertBlock |

      assertBlock := Smalltalk compiler evaluate: '[ :asserter | asserter deny: ''', aString, ''' ', assertionDef, ' ]'.
      assertBlock value: self.
]

{ #category : #tests }
TomeFeatureAssertion >> testSucessFor: aString [

    "Verify if the assertion is successful for a string"

    | assertBlock |

     assertBlock := Smalltalk compiler evaluate: '[ :asserter | asserter assert: ''', aString, ''' ', assertionDef, ' ]'.
     assertBlock value: self.

]
