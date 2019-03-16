*SBDD-Core
isAScenarioOutline

	^ self pragmas anySatisfy: [:pragma | pragma selector = #scenarioOutline ].