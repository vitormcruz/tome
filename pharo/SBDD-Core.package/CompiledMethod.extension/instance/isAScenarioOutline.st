*SBDD-Core
isAScenarioOutline

	^ (self methodClass inheritsFrom: Feature class) and: 
     [self pragmas anySatisfy: [:pragma | pragma selector = #scenarioOutline ]]
