scenario outline
scenario: scenarioName def: definition run: aBlock
	^ Scenario withName: scenarioName
				  definition: definition
				  executionBlock: aBlock.