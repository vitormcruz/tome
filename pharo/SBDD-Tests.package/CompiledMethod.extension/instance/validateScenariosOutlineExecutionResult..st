*SBDD-Tests
validateScenariosOutlineExecutionResult: scenariosCreated

	[ (scenariosCreated respondsTo: #isEmpty) not ], 
   [ scenariosCreated isEmpty ], 
   [ (scenariosCreated containsOnlyElementsOfType: Symbol) not ]
	ifAnyTrue: [ ScenarioOutlineGeneratedNoScenario signal: 'A scenario outline should create one or more scenarios and return it''s selectors.' ].
	
	^ scenariosCreated.