tests
test_definition_of_slash_binary_method

	self shouldnt: [ MAMethodDescription new whereParams: { MANumberDescription new accessor: #/; min: 20. } ]
		  raise: Error.
