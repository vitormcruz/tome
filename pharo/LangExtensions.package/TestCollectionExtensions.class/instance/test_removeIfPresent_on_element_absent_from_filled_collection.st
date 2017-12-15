removing
test_removeIfPresent_on_element_absent_from_filled_collection

	| collectionWithout1 |
	
	collectionWithout1 := #(2 3 4 5 6) asOrderedCollection.
	self assertBlock: [ (collectionWithout1 removeIfPresent: 1) = nil ].