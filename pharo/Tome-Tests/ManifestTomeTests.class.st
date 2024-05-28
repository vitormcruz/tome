"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTomeTests,
	#superclass : #PackageManifest,
	#category : #'Tome-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestTomeTests class >> ruleUncommonMessageSendRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#TomeScenarioTest)) #'2024-05-28T09:31:17.731-03:00') )
]
