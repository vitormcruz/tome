tests
testNew

	self should: [ NullObject new ]
		  raise: Error 
		  withExceptionDo: [ :ex | ex messageText = 'A NullObject should be created with one of it''s custom instance creation methods.' ]