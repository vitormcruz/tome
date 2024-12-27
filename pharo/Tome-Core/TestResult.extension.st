Extension { #name : #TestResult }

{ #category : #'*Tome-Core' }
TestResult >> filterForClass: aClass [

	<todo: 'Add tests'>
	
	| aFilteredTestResult |
	
	aFilteredTestResult := self class new.
	passed do: [ :aTest | aTest class = aClass ifTrue: [ aFilteredTestResult addPass: aTest ] ].
	failures  do: [ :aTest | aTest class = aClass ifTrue: [ aFilteredTestResult addFailure: aTest ] ].
	errors do: [ :aTest | aTest class = aClass ifTrue: [ aFilteredTestResult addError: aTest ] ].
	skipped do: [ :aTest | aTest class = aClass ifTrue: [ aFilteredTestResult addSkip: aTest ] ].
	
	^ aFilteredTestResult.
	
]
