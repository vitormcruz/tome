Extension { #name : #TestResult }

{ #category : #'*Tome-Adapter-Web' }
TestResult >> printOnAsHtmlFragment: aStream resultsFrom: aFeatureClass [

	aFeatureClass isFeature ifFalse: [ ^ self ].

	aFeatureClass printOnAsHtml: aStream.
	aStream 
		nextPut: Character cr;
		nextPut: Character cr.

	self failures do: [ :testCase | testCase concreteScenario printOnAsHtmlFragment: aStream ].
	self errors do: [ :testCase | testCase concreteScenario printOnAsHtmlFragment: aStream ].
	self passed do: [ :testCase | testCase concreteScenario printOnAsHtmlFragment: aStream ].
]

{ #category : #'*Tome-Adapter-Web' }
TestResult >> toHtmlFileAt: aFileReference resultsFrom: aFeatureClass [

	aFeatureClass isFeature ifFalse: [ ^ self ].

	aFileReference ensureCreateFile.

	aFileReference writeStreamDo: [ :stream | 
		stream 
			nextPutAll: '<html>'; cr;
			nextPutAll: '<head></head>'; cr;
			nextPutAll: '<body>'; cr;
			nextPutAll: '<pre>'; cr.
			
		self printOnAsHtmlFragment: stream resultsFrom: aFeatureClass.
		
		stream
			nextPutAll: '</pre>'; cr;
			nextPutAll: '</body>'; cr;
			nextPutAll: '</html>'.
			
	].

	^ aFileReference
]
