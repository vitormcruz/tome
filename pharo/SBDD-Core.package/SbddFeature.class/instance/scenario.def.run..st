scenario outline
scenario: scenarioName def: definition run: aBlock
	^ SbddScenario withName: scenarioName
				  definition: definition
				  executionBlock: aBlock.