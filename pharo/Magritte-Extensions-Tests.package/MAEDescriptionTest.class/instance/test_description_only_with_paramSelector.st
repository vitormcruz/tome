tests
test_description_only_with_paramSelector

	self shouldnt: [MADescription basicNew paramSelector: #p1:]
        raise: ParamDescriptionError.
