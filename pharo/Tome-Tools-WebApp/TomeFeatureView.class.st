Class {
	#name : #TomeFeatureView,
	#superclass : #WAComponent,
	#instVars : [
		'selectedFeatureClass',
		'testResult'
	],
	#category : #'Tome-Tools-WebApp-Core'
}

{ #category : #public }
TomeFeatureView >> clear [

	selectedFeatureClass := nil.
	testResult := nil.
]

{ #category : #exporting }
TomeFeatureView >> generateSimplePageOnStream: aFile [

	aFile writeStreamDo: [ :aFileStream |
		WAHtmlCanvas builder 
			documentClass: WAHtmlDocument ;
			rootClass: WAHtmlRoot;
			fullDocument: true;
			rootBlock: [ :root | root style: self style ];
			render: self on: aFileStream.		
	]
	

]

{ #category : #rendering }
TomeFeatureView >> renderContentOn: html [

	selectedFeatureClass ifNil: [ Error signal: 'TomeFeatureView can render only if a feature class is provided.' ].
	
	testResult := testResult ifNil: [ selectedFeatureClass suite run ]
										 ifNotNil: [ testResult filterForClass: selectedFeatureClass ].
	
	html heading level1 with: 'Feature: ' , selectedFeatureClass featureName.
	self renderSumaryOf: testResult on: html.	
	html div class: 'feature-scenario-splitter'.	
		
	html div class: 'feature-content'; with: [
		self renderFailedScenarios: (testResult failures collect: [ :test | test scenarioToRun asScenarioHtml]) on: html.
		html div class: 'scenario-section-splitter'.
		
		self renderErrorScenarios: (testResult errors collect: [ :test | test scenarioToRun asErrorScenarioHtml errorTestCase: test]) on: html.
		html div class: 'scenario-section-splitter'.
		
		self renderPassedScenarios: (testResult passed collect: [ :test | test scenarioToRun asScenarioHtml]) on: html.
	].

	html div class: 'end-page-space'.	
]

{ #category : #'rendering-scenarios' }
TomeFeatureView >> renderErrorScenarios: scenariosError on: html [

	self renderScenarios: scenariosError on: html usingClassTypePrefix: 'error'.
]

{ #category : #'rendering-scenarios' }
TomeFeatureView >> renderFailedScenarios: scenariosFailed on: html [

	self renderScenarios: scenariosFailed on: html usingClassTypePrefix: 'failed'.
]

{ #category : #'rendering-scenarios' }
TomeFeatureView >> renderPassedScenarios: scenariosPassed on: html [

	self renderScenarios: scenariosPassed on: html usingClassTypePrefix: 'passed'.
]

{ #category : #'rendering-scenarios' }
TomeFeatureView >> renderScenarios: scenarios on: html usingClassTypePrefix: classTypePrefix [

	scenarios ifEmpty: [ ^ self ].
	
	html div 
		class: 'scenarios-result-container'; 
		with: [ 
			html div class: 'scenarios-', classTypePrefix.
			html div
				class: 'scenarios-body-', classTypePrefix;
			 	with: [ scenarios do: [ :scenario | scenario renderOn: html ] ]
		].
	

]

{ #category : #rendering }
TomeFeatureView >> renderSumaryOf: testResult on: html [

	html div 
		class: 'test-result-summary';
		with: (String streamContents: [ :stream | testResult printOn: stream ]).
]

{ #category : #accessing }
TomeFeatureView >> selectedFeatureClass: aFeatureClass [

	selectedFeatureClass := aFeatureClass.
]

{ #category : #hooks }
TomeFeatureView >> style [
	"Returns a CSS stylesheet associated with this component. This stylesheet will be added to <head> section of the html document so it will be global and not scoped.

	This is done for all visible components (see class comment of WAComponent for what visible means).

	Nice for demos but consider using WAFileLibrary or external files instead."

	^ '
	div.feature-content{
		padding-left: 1rem;
	}
	
	div.feature-scenario-splitter{
		height: 2rem;
	}
	
	div.test-result-summary{
		font-size: medium;
	}
	
	span.scenario-label{
		font-size: small;
		font-weight: 100;		
	}
	
	div.scenario-section-splitter{
		height: 0.5rem;
	}
	
	div.scenarios-result-container{
 	  display: grid;
	  grid-template-columns: 0.4rem auto
	
	}
	
	div.scenarios-failed{
 	  background-color: #fdd260; 
	}

	div.scenarios-error{
 	  background-color: #e78778; 
	}
	
	div.scenarios-passed{
 	  background-color: #9af085;
	}
	
	div.scenarios-body-failed{
		padding-left: 0.5rem;
	}
	
	div.scenarios-body-error{
	  padding-left: 0.5rem;
	}
	
	div.scenarios-body-passed{
	  padding-left: 0.5rem;
	}
	
	span.scenario-param-was-used{
		color: green;
	}
	
	span.scenario-param-was-not-used{
		color: #db9f00;
	}
	
	span.scenario-param-assertion-failed{
		color: #bf3620;
	}
	
	.scenarios-body-error .scenario-param-was-not-used,.scenario-param-was-used{
		color: black;
	}
	
	span.scenario-header{
		font-size: 1.7rem;
		font-weight: bold;
	}
	
	div.definition-body{
	  font-size: 1.7rem;
	  padding-top: 0.5rem;
	  padding-bottom: 0.5rem;
	}
	
	div.definition-body-error-container{

	}
	
	div.scenario-text-body{
	}

	
	div.error-body{
	  font-size: 0.9rem;
	  margin-top: 0.5rem;
	  max-height: 15rem;
	  max-width: 85%;
	  overflow-x: scroll; 
	  overflow-y: scroll; 
 	  background-color: #FFCCCC; 
	}
	
	div.end-page-space{
		height: 2rem;
	}
	

'
]

{ #category : #accessing }
TomeFeatureView >> testResult: aTestResult [

	testResult := aTestResult.
]
