scenarios
Validate_Method_Parameters_Scenario

	^ self scenario:   'Validate method parameters scenario' 
		    withSteps: {'Given the following message: forEmployee: aString setSalary: aPositiveInteger'.
				  		   'and that it has the following description:
						   	  "aString must be a non null string and aPositiveInteger must be a mandatory positive integer"'.
						   'if I try to send the following message {message_send}'.
						   'then the following errors will be found: "{errors}"'.
		    				}
						
		    examples:  #(('message_send' #errors)
							  ('"forEmployee: ''John'' setSalary: 2000"' 'no error')
						  	  ('"forEmployee: nil setSalary: nil"' 'Employee name is mandatory, Salary is mandatory and must be a positive integer')
							  ('"forEmployee: ''John'' setSalary: 0"' 'Salary is mandatory and must be a positive integer')
							  ('"forEmployee: ''John'' setSalary: -100"' 'Salary is mandatory and must be a positive integer'))
														
		    executeWithExtractedParams: [:description :messageSent :expectedErrorsString | 
		        Smalltalk compiler source: 'DvmDescribedClassForFeatureTest new ' , messageSent, '; yourself'; evaluate.
			  	  self assert: (validationObserver errors collect: #error) asSet 
						 equals: (self extractInternalErrorsFrom: expectedErrorsString) asSet
		    ].

