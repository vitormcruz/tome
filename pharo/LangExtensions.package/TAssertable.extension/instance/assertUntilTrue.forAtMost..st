*LangExtensions-asserting
assertUntilTrue: assertionBlock forAtMost: waitTimeInMiliseconds
"For waitTimeInMiliseconds wait until assertion block resolves to true"

	| startTime assertionBlockBody blockStart blockEnd|
	
	startTime := Time millisecondClockValue.
	[ assertionBlock value | (Time millisecondClockValue - startTime > waitTimeInMiliseconds)] whileFalse:
	[ (Delay forMilliseconds: 50) wait ].
	
	assertionBlockBody := assertionBlock sourceNode body.
	blockStart := assertionBlockBody sourceInterval first.
	blockEnd := assertionBlockBody sourceInterval last.
	self assert: assertionBlock value description: 'Failed to evaluate ', (assertionBlockBody source copyFrom: blockStart to: blockEnd).