scenarios
Collect_Errors_Notifications_From_Execution_Scenario

	<scenarioOutline>

	self scenarioOutline: 'Collect errors notifications from inspected execution' 
		  def: 'When I inspec a {execution type} execution, the following errors will be found: {list of error}'
		  examples:  #(     'execution type'    'list of errors'                             ) asHeaderFor
					     - #(    'valid'               'no error'                               )
						  - #(   'invalid'           'Mandatory field "name" was not provided, ' )
		  run: [ :executionType :listError | self Collect_Errors_Notifications_From_Execution_Def: {executionType. listError} ].