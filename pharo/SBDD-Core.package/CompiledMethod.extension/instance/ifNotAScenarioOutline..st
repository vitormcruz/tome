*SBDD-Core
ifNotAScenarioOutline: aBlock

	^ self isAScenarioOutline ifFalse: aBlock.
