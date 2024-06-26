"
See `TomeFeature` comment section for a complete description of Tome.
"
Class {
	#name : #ManifestTomeCore,
	#superclass : #PackageManifest,
	#category : #'Tome-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestTomeCore class >> ruleGRAnsiConvertorRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'Tome-Core')) #'2024-04-30T11:29:06.581-03:00') )
]

{ #category : #'code-critics' }
ManifestTomeCore class >> ruleGRAnsiExceptionsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'Tome-Core')) #'2024-04-30T11:28:59.157-03:00') )
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

{ #category : #'code-critics' }
ManifestTomeCore class >> ruleUsesAddRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#TomeScenario #when: #false)) #'2024-03-21T11:10:52.547-03:00') )
]
