Class {
	#name : #TomeFuelReportingChain,
	#superclass : #TomeScenarioReportingChain,
	#category : #'Tome-Core'
}

{ #category : #accessing }
TomeFuelReportingChain >> handle: aTestResult [

	| fuelFolder  |
	
	fuelFolder := reportingFolder / ((self extractFeatureClassFrom: aTestResult) name , '.fuel').
	fuelFolder ensureDelete.
	fuelFolder ensureCreateFile. 
	FLSerializer new
        when: [ :o | o isParamProxy ] substituteBy: [ :o | o proxyHandler ]; "Proxies cause problems to tha serializer"
        when: [ :o | o isBlock ] substituteBy: [ :o | nil ]; "Ignoring blocks"
			object: aTestResult;
			filePath: fuelFolder pathString;
			serialize
]
