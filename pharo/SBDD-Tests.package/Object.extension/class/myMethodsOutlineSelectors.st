*SBDD-Tests
myMethodsOutlineSelectors

	^ self class methods chain select: [ :method | method isAScenarioOutline ]; collect: #selector.