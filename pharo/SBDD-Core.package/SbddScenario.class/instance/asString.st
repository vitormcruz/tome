converting
asString

 ^ ('Scenario: ', name , '<n>' , 
	 definition , '<n>' , 
	 (self parseBlockClosure: executionBlock)) expandMacros.