enumerating
countBinaryParams: anOrderedCollection ifMoreThanOneDo: aBlock

	^ (anOrderedCollection count: [ :paramDesc | paramDesc accessor selector isBinary ]) > 1
		ifTrue: aBlock