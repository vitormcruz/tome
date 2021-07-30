"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSBDDTests,
	#superclass : #PackageManifest,
	#category : 'SBDD-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestSBDDTests class >> ruleRBExtraBlockRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SbddFeatureTest #buildScenarioTestExecutionNamed:described:andWithExecution: #false)) #'2020-04-17T22:43:11.355826-03:00') )
]
