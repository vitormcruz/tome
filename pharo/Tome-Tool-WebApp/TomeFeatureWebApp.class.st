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
		self renderFailedScenarios: (testResult failures collect: [ :test | test concreteScenario asScenarioHtml]) on: html.
		html div class: 'scenario-section-splitter'.
		
		self renderErrorScenarios: (testResult errors collect: [ :test | test concreteScenario asErrorScenarioHtml])  on: html.
		html div class: 'scenario-section-splitter'.
		
		self renderPassedScenarios: (testResult passed collect: [ :test | test concreteScenario asScenarioHtml]) on: html.
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
TomeFeatureWebApp >> renderScenarios: scenarios on: html usingClassTypePrefix: classTypePrefix [

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
	
	span.scenario-header{
		font-weight: bold;
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
	
	div.definition-body{
	  font-size: large;
	  padding-top: 0.5rem;
	  padding-bottom: 0.5rem;
	}
	
	div.definition-body-error-container{

	}
	
	div.scenario-text-body{
	}

	
	div.error-body{
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

{ #category : #updating }
TomeFeatureWebApp >> updateRoot: anHtmlRoot [
	"Override this method to modify the Root object of a Document while rendering. This
	method is usually called by a WAUpdateRootVisitor.
	
	If you are using Painters within a tree of Presenters/Components, this method will not
	be called unless the Painter is included in the list of children of the Presenter."
	
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Feature'.
]
