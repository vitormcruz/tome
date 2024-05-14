"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTomeToolsWebApp,
	#superclass : #PackageManifest,
	#category : #'Tome-Tools-WebApp-Manifest'
}

{ #category : #'code-critics' }
ManifestTomeToolsWebApp class >> ruleGRAnsiCollectionsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'Tome-Tools-WebApp')) #'2024-05-14T10:06:14.046-03:00') )
]
