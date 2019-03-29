tests
test_description_only_with_accessor

	self shouldnt: [MADescription basicNew accessor: #p1:]
        raise: ParamDescriptionError.
