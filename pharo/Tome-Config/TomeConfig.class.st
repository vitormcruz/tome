Class {
	#name : #TomeConfig,
	#superclass : #Object,
	#classInstVars : [
		'reportExecutionAsHtml',
		'htmlReportingFolder'
	],
	#category : #'Tome-Config'
}

{ #category : #configuration }
TomeConfig class >> htmlReportingFolder [

	^ htmlReportingFolder.
]

{ #category : #configuration }
TomeConfig class >> htmlReportingFolder: aPathString [

	htmlReportingFolder := aPathString


]

{ #category : #settings }
TomeConfig class >> mySettingSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #tomeSettings)
		target: TomeConfig;
		label: 'Tome Settings';
		parent: nil.
		
	(aBuilder setting: #reportExecutionAsHtml)
		target: TomeConfig;
		label: 'Report Feature Execution';
		description: 'Report Feature Execution as Html Pages';
		parent: #tomeSettings.
		
	(aBuilder setting: #htmlReportingFolder)
		target: TomeConfig;
		label: 'Html Reporting Folder';
		default: './target/specificationTestResult';
		description: 'Folder to store the Executable Specificaion Results as HTML, defults to ./target/specificationTestResult';
		parent: #tomeSettings.
		

]

{ #category : #configuration }
TomeConfig class >> reportExecutionAsHtml [

	^ reportExecutionAsHtml ifNil: [ ^ reportExecutionAsHtml := false ].
]

{ #category : #configuration }
TomeConfig class >> reportExecutionAsHtml: anObject [

	<todo: 'Test TomeFeature Suite reporting implementation'>
	reportExecutionAsHtml := anObject.

	reportExecutionAsHtml
		ifTrue: [ self turnHtmlReportingOn ]
		ifFalse: [ self turnHtmlReportingOff ]
]

{ #category : #configuration }
TomeConfig class >> turnHtmlReportingOff [

	TomeFeatureSuite clearReporting.
]

{ #category : #configuration }
TomeConfig class >> turnHtmlReportingOn [

	TomeFeatureSuite addReporting: (TomeHTMLReportingChain new reportingFolder: htmlReportingFolder).
]
