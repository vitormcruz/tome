tests
test_accessor_reader

	self assert: (MAMethodDescription new whereParams: { MAStringDescription new accessor: #p1.
				 													    MANumberDescription new accessor: #p2}; accessor)
        equals: (MASelectorAccessor read: nil write: #p1:p2:).