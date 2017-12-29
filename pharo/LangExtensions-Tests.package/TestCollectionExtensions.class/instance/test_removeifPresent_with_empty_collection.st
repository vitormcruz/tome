removing
test_removeifPresent_with_empty_collection

	| emptyCollection |
	
	emptyCollection := OrderedCollection new.
	self assertBlock: [ (emptyCollection removeIfPresent: 1) = nil ].