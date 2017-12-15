removing
test_removeIfPresent_on_element_present_on_collection

	| collectionWith1 |
	
	collectionWith1 := #(1 2 3 4 5 6) asOrderedCollection.
	self assertBlock: [ (collectionWith1 removeIfPresent: 1) = 1 ].