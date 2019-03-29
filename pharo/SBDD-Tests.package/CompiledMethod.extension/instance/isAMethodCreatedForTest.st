*SBDD-Tests
isAMethodCreatedForTest

	^ self pragmas anySatisfy: [:pragma | pragma selector = #createdForTest ].