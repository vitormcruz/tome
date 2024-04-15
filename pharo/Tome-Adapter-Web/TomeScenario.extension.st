Extension { #name : #TomeScenario }

{ #category : #'*Tome-Adapter-Web' }
TomeScenario >> htmlFormattedDefinition [

	^ String streamContents: [ :stream | 
		definition withBlanksCondensed lines 
			do: [ :line | 
				stream tab; 
				       tab; 
		    	       nextPutAll: line;
				       cr.	
			]
	] 
]

{ #category : #'*Tome-Adapter-Web' }
TomeScenario >> printOnAsHtmlFragment: aStream [
	
	aStream
		tab;
		nextPutAll: 'Scenario: ';
		nextPutAll: '<b>';
		nextPutAll: name;
		nextPutAll: '</b>'; cr;
		nextPutAll: self htmlFormattedDefinition; cr; cr
	
]
