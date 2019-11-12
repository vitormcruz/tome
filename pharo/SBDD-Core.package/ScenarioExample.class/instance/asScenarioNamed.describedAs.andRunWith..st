converting
asScenarioNamed: aScenarioName describedAs: aScenarioDescription andRunWith: aBlock

	^ Scenario withName: aScenarioName
					definition: (self applyTo: aScenarioDescription)
					executionBlock: aBlock.

		