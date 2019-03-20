*SBDD-Core
representAScenarioAt: aClass correctlyCreatedBy: aScenarioOutlineNameSymbol

	| scenarioOutlineOriginPragma |
	
	scenarioOutlineOriginPragma := (aClass instanceSide compiledMethodAt: self) pragmaAt: #scenarioGeneratedBy:.
	
	[scenarioOutlineOriginPragma isNotNil],
   [scenarioOutlineOriginPragma withArgumentsDo: [ :pragParam | pragParam = aScenarioOutlineNameSymbol] ]
   ifAnyFalse: [ 
		ScenarioGeneratedWithoutCorrectAnnotation signal: 'This scenario outline should create one or more scenarios with "scenarioGeneratedBy:', aScenarioOutlineNameSymbol, '" annotation' 
	].
	