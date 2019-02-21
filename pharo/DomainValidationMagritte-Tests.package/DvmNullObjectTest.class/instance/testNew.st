tests
testNew

	self should: [ DvmNullObject new ]
		  raise: Error 
		  withExceptionDo: [ :ex | ex messageText = 'A NullObject should be created with one of it''s custom instance creation methods.' ]