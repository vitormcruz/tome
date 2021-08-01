"
test
"
Class {
	#name : #ManifestTomeCore,
	#superclass : #PackageManifest,
	#category : 'Tome-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestTomeCore class >> ruleRBCollectSelectNotUsedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'TestFeature class' #testParameters #true)) #'2019-11-02T21:09:19.854109-03:00') #(#(#RGClassDefinition #(#SbddFeature)) #'2019-11-17T17:37:08.066537-03:00') )
]

{ #category : #'code-critics' }
ManifestTomeCore class >> ruleRBStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#'Tome-Core')) #'2019-03-17T16:20:10.493314-03:00') )
]
