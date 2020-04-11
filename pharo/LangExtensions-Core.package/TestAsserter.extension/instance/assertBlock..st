*LangExtensions-Core
assertBlock: assertionBlock
"Assert that a block value evaluates to true. If not, prints the block code itself in the assertion error description."

	| assertionBlockBody blockStart blockEnd|
	
	assertionBlockBody := assertionBlock sourceNode body.
	blockStart := assertionBlockBody sourceInterval first.
	blockEnd := assertionBlockBody sourceInterval last.
	self assert: assertionBlock value description: 'Failed to evaluate "', (assertionBlockBody source copyFrom: blockStart to: blockEnd) , '"'.