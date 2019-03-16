*SBDD-Core
isAMethodCreatedForTest

	^ self pragmas anySatisfy: [:pragma | pragma selector = #createdForTest ].