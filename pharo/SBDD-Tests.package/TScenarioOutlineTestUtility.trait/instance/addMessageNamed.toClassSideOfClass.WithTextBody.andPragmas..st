utility
addMessageNamed: aString toClassSideOfClass: aClass WithTextBody: aMehodBodyString andPragmas: aCollectionOfPragmas

	aClass class compile: aString, '
		' , (aCollectionOfPragmas chain 
										 collect: [ :it | '<{1}>' format: {it} ]; 
				 						 reduce: [ :a :b | a, Character cr asString , b ]) , '
		
		', aMehodBodyString, '
	'.