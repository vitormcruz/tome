scenarios
Collect_Errors_Notifications_From_Execution_Scenario

	self scenario: 'Collect errors notifications from inspected execution' 
		  withSteps: {'When I inspec a <execution type> execution, the following errors will be found: <list of errors>'.}
		  examples:  #(('execution type' 'list of errors')
							('valid'   'no error')
							('invalid' 'Mandatory field "name" was not provided, '))
		  executeWithExtractedParams: [:extractedParams | self Collect_Errors_Notifications_From_Execution_Def: extractedParams].