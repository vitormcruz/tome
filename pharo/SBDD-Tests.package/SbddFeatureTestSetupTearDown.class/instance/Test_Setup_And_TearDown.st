scenario definition
Test_Setup_And_TearDown

	<scenario>

	^ self scenarioOutline: 'Test if Setup and TearDown are working correctly'
			 def: 'Execute the {execution}th time' 
			examples: #(execution) asHeaderFor 
					  - #(1)
					  - #(2)
					  - #(3)
			run: [ :execution |
				self assert: setUpCollection isEmpty.
				self assert: tearDownCollection isEmpty.
				setUpCollection add: execution.
				tearDownCollection add: execution.
			] 
