scenarios
Validate_Method_Parameters_Scenario
	<gtExample>

	| describedClass |
	
	^ self scenario:   'Validate method parameters scenario' 
		    withSteps: {'Given the following message forEmployee: aString setSalary: aPositiveInteger'.
				  		   'and that it has the following description:
						   	  "aString must be a non null string and aPositiveInteger must be a positive integer"'.
						   'if I try to send the following message {message_send}'.
						   'then the following errors will be found: {errors}'.
		    				}
		    examples:  ((DataFrame fromRows: #(('"forEmployee: ''John'' setSalary: 2000"' 'no error')
														  ('"forEmployee: nil setSalary: nil"' 'Employee name is mandatory, Salary is mandatory and must be a positive integer')
													  	  ('"forEmployee: ''John'' setSalary: 0"' 'Salary is mandatory and must be a positive integer')
														  ('"forEmployee: ''John'' setSalary: -100"' 'Salary is mandatory and must be a positive integer')
														 )) columnNames: #('message_send' 'errors'))
		    executeWithExtractedParams: [:description :messageSent :expectedErrorsString | 
		        describedClass := OpalCompiler new source: 'DescribedClass new ' , messageSent, '; yourself'; evaluate.
			  	self assert: describedClass errors equals: (self extractInternalErrorsFrom: expectedErrorsString )
		    ].

