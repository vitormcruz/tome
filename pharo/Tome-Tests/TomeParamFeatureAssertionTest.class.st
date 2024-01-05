Class {
	#name : #TomeParamFeatureAssertionTest,
	#superclass : #TestCase,
	#category : #'Tome-Tests'
}

{ #category : #tests }
TomeParamFeatureAssertionTest >> test_validate_when_parameter_assertion_fails [

    | param |
    param := TomeParamFeatureAssertion newForDef: 'equals: 1'.
    param assertSuccessFor: 1.
    self assert: (param wasUsed).

	

]

{ #category : #tests }
TomeParamFeatureAssertionTest >> test_validate_when_parameter_assertion_was_not_used [

    | param |
    param := TomeParamFeatureAssertion newForDef: 'equals: 1'.
    self deny: (param wasUsed).

	

]

{ #category : #tests }
TomeParamFeatureAssertionTest >> test_validate_when_parameter_ok_assertion_was_used [

    | param |
    param := TomeParamFeatureAssertion newForDef: 'equals: 1'.
    param assertSuccessFor: 1.
    self assert: (param wasUsed).

	

]
