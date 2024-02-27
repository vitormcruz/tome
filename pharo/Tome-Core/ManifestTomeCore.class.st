"
See `TomeFeature` comment section for a complete description of Tome.
"
Class {
	#name : #ManifestTomeCore,
	#superclass : #PackageManifest,
	#category : #'Tome-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestTomeCore class >> ruleBadMessageRule2V1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'TomeFeature class' #protoParametersFor: #true)) #'2024-02-27T14:04:29.583-03:00') #(#(#RGMethodDefinition #(#TomeScenarioBuilderProtoParameter #convertInScenarioFor: #false)) #'2024-02-27T14:38:14.882-03:00') )
]

{ #category : #'code-critics' }
ManifestTomeCore class >> ruleCollectSelectNotUsedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'TomeFeature class' #calculateProtoParameters #true)) #'2021-10-08T09:51:12.573064-03:00') )
]

{ #category : #'code-critics' }
ManifestTomeCore class >> ruleRBCollectSelectNotUsedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'TestFeature class' #testParameters #true)) #'2019-11-02T21:09:19.854109-03:00') #(#(#RGClassDefinition #(#TomeFeature)) #'2019-11-17T17:37:08.066537-03:00') )
]

{ #category : #'code-critics' }
ManifestTomeCore class >> ruleRBStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#'Tome-Core')) #'2019-03-17T16:20:10.493314-03:00') )
]

{ #category : #'code-critics' }
ManifestTomeCore class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#TomeScenario #run #false)) #'2024-01-08T08:48:34.597-03:00') )
]
