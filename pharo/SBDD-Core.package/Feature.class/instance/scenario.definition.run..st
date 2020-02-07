scenario outline
scenario: scenarioName definition: definition run: aBlock
	^ Scenario withName: scenarioName
				  definition: definition
				  executionBlock: aBlock.