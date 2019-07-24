*SBDD-Core
executeMeAsScenarioOutline

	| selectorsMethodsCreated |

	self ifNotAScenarioOutline: [ ^ self ].
	
	selectorsMethodsCreated := self valueWithReceiver: self methodClass instanceSide 
										     arguments: #().
	
	self validateScenariosOutlineExecutionResult: selectorsMethodsCreated.
	selectorsMethodsCreated do: [ :selectorCreated | 
		selectorCreated representAScenarioAt: self methodClass 
							 correctlyCreatedBy: self selector  
	].