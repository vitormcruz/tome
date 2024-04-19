Extension { #name : #TomeScenario }

{ #category : #'*Tome-Adapter-Web' }
TomeScenario >> printOnAsHtmlFragment: aStream [
	
	aStream
		tab;
		nextPutAll: 'Scenario: ';
		nextPutAll: '<b>';
		nextPutAll: name;
		nextPutAll: '</b>'; cr;
		nextPutAll: self definition; cr; cr
	
]
