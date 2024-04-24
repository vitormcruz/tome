Class {
	#name : #TomeFeatureWebApp,
	#superclass : #WAComponent,
	#pools : [
		'TomeCSSClasses'
	],
	#category : #'Tome-Tool-WebApp'
}

{ #category : #testing }
TomeFeatureWebApp class >> canBeRoot [
	"When returning true, the component can be registered as a standalone application from the configuration interface."

	^ true
]

{ #category : #'class initialization' }
TomeFeatureWebApp class >> initialize [
	| app |

	app := WAAdmin register: self asApplicationAt: 'Tome'.
]

{ #category : #'as yet unclassified' }
TomeFeatureWebApp >> generateSinplePage [

^  WAHtmlCanvas builder 
		documentClass: WAHtmlDocument ;
		rootClass: WAHtmlRoot;
		fullDocument: true;
		rootBlock: [ :root | root style: TomeFeatureWebApp new style ];
		render: TomeFeatureWebApp new.
]

{ #category : #rendering }
TomeFeatureWebApp >> renderContentOn: html [

	| testResult |
	testResult := TomeFeatureExamples suite run.
	
	html heading level2 with: 'Feature: ' , TomeFeatureExamples featureName.
	self renderSumaryOf: testResult on: html.	
	html div class: 'feature-scenario-splitter'.	
		
	html div class: 'feature-content'; with: [
		self renderFailedScenarios: (testResult failures collect: #concreteScenario) on: html.
		html div class: 'scenario-section-splitter'.
		
		self renderErrorScenarios: (testResult errors collect: #concreteScenario) on: html.
		html div class: 'scenario-section-splitter'.
		
		self renderPassedScenarios: (testResult passed collect: #concreteScenario) on: html.
	].

	html div class: 'end-page-space'.	

]

{ #category : #'rendering-scenarios' }
TomeFeatureWebApp >> renderErrorScenarios: scenariosError on: html [

	self renderScenarios: scenariosError on: html usingClassTypePrefix: 'error'.
]

{ #category : #'rendering-scenarios' }
TomeFeatureWebApp >> renderFailedScenarios: scenariosFailed on: html [

	self renderScenarios: scenariosFailed on: html usingClassTypePrefix: 'failed'.
]

{ #category : #'rendering-scenarios' }
TomeFeatureWebApp >> renderPassedScenarios: scenariosPassed on: html [

	self renderScenarios: scenariosPassed on: html usingClassTypePrefix: 'passed'.
]

{ #category : #'rendering-scenarios' }
TomeFeatureWebApp >> renderScenario: scenario on: html [

	html span
		class: 'scenario-header';
		with: scenario name.

	html div 
		class: 'definition-body';
		with: [ 
			| htmlLines htmlParamsStream |
			
			htmlLines := scenario definition lines collect: [ :line | (TomeScenarioHtmlLine on: line)].
			htmlParamsStream := ReadStream on: (scenario parameters collect: [ :param2 | TomeScenarioHtmlParam on: param2 ]).
			htmlLines do: [ :htmlLine | htmlLine renderOn: html usingHtmlParamsStream: htmlParamsStream ].		
		]
	
]

{ #category : #'rendering-scenarios' }
TomeFeatureWebApp >> renderScenarios: scenarios on: html usingClassTypePrefix: classTypePrefix [

	scenarios ifEmpty: [ ^ self ].
	
	html div 
		class: 'scenario-container'; 
		with: [ 
			html div class: 'scenarios-', classTypePrefix.
			html div
				class: 'scenarios-body-', classTypePrefix;
			 	with: [ scenarios do: [ :scenario | self renderScenario: scenario on: html ] ]
		].
	

]

{ #category : #rendering }
TomeFeatureWebApp >> renderSumaryOf: testResult on: html [

	html div 
		class: 'test-result-summary';
		with: (String streamContents: [ :stream | testResult printOn: stream ]).
]

{ #category : #hooks }
TomeFeatureWebApp >> style [
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
		font-size: smaller;
	}
	
	span.scenario-label{
		font-size: small;
		font-weight: 100;		
	}
	
	div.scenario-section-splitter{
		height: 0.5rem;
	}
	
	div.scenario-container{
 	  display: flex;
	}
	
	div.scenarios-failed{
	  width: 0.4rem;
 	  background-color: #fdd260; 
	}

	div.scenarios-error{
	  width: 0.4rem;
 	  background-color: #e78778; 
	}
	
	div.scenarios-passed{
	  width: 0.4rem;
 	  background-color: #9af085;
	}
	
	div.scenarios-body-failed{
	  flex-grow: 1;
		padding-left: 0.5rem;
	}
	
	div.scenarios-body-error{
	  flex-grow: 1;
	  padding-left: 0.5rem;
	}
	
	div.scenarios-body-passed{
	  flex-grow: 1;
	  padding-left: 0.5rem;
	}
	
	span.scenario-header{
		font-size: normal;
		font-weight: bold;
	}

	span.scenario-param-was-used{
		color: blue;
	}
	
	span.scenario-param-was-not-used{
		color: red;
	}
	
	div.definition-body{
		font-size: large;
		padding-top: 0.5rem;
		padding-bottom: 0.5rem;
	}
	
	div.end-page-space{
		height: 2rem;
	}
	

'
]
