scenarios
Collect_Errors_Notifications_From_Execution_Scenario

	self scenario: 'Collect errors notifications from inspected execution' 
		  withSteps: {'When I inspec a <execution type> execution, the following errors will be found: <list of errors>'.}
		  examples:  ((DataFrame fromRows: #(('valid'   'no error')
														('invalid' 'Mandatory field "name" was not provided, ')
														)) columnNames: #('execution type' 'list of errors'))
		  executeWithExtractedParams: [:extractedParams | self Collect_Errors_Notifications_From_Execution_Def: extractedParams].