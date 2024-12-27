Class {
	#name : #ManifestTomeToolsWebApp,
	#superclass : #PackageManifest,
	#category : #'Tome-Tools-WebApp-Manifest'
}

{ #category : #'code-critics' }
ManifestTomeToolsWebApp class >> ruleGRAnsiCollectionsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #( #( #( #RGPackageDefinition #( #'Tome-Tools-WebApp' ) )
	        #'2024-05-14T10:06:14.046-03:00' ) )
]

{ #category : #'code-critics' }
ManifestTomeToolsWebApp class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#TomeHTMLReportingChain #handle: #false)) #'2024-11-22T15:42:29.941-03:00') )
]
