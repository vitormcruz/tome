Class {
	#name : #TomeReportingWebApp,
	#superclass : #WAComponent,
	#instVars : [
		'children',
		'featureView',
		'featuresSelectionView',
		'viewToShow'
	],
	#category : #'Tome-Tools-WebApp'
}

{ #category : #testing }
TomeReportingWebApp class >> canBeRoot [
	"When returning true, the component can be registered as a standalone application from the configuration interface."

	^ true
]

{ #category : #'class initialization' }
TomeReportingWebApp class >> initialize [
	| app |

	app := WAAdmin register: self asApplicationAt: 'Tome'.
]

{ #category : #hooks }
TomeReportingWebApp >> children [

	^ children.
]

{ #category : #initialization }
TomeReportingWebApp >> initialize [ 

	super initialize.
	
	featuresSelectionView := TomeFeatureSelectionView new.
	featuresSelectionView onAnswer: [ :selectedFeatureClass | 
		featureView selectedFeatureClass: selectedFeatureClass.
		viewToShow := featureView
	].
	
	featureView := TomeFeatureView new.
	viewToShow := featuresSelectionView.
	
	children := OrderedCollection new.
	children 
		add: featuresSelectionView;
		add: featureView.
]

{ #category : #rendering }
TomeReportingWebApp >> renderContentOn: html [

	html div class: 'banner'; with: [ 
		html anchor 
			url: '/Tome';
			with:  'Feature Reporting'.
	].
		
	html render: viewToShow.

]

{ #category : #hooks }
TomeReportingWebApp >> style [

	^'
	div.banner{
		padding-top: 2rem;
		padding-bottom: 2rem;
		background-color: #8282f0;
		margin-bottom: 2rem;0
	}
	
	div.banner a{
		font-size: 3rem;
		font-weight: bold;
		color: white;
		text-decoration: none !important;
		padding-left: 2rem;
	}
	
'
]

{ #category : #updating }
TomeReportingWebApp >> updateRoot: anHtmlRoot [
	"Override this method to modify the Root object of a Document while rendering. This
	method is usually called by a WAUpdateRootVisitor.
	
	If you are using Painters within a tree of Presenters/Components, this method will not
	be called unless the Painter is included in the list of children of the Presenter."
	
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Tome Reporting'.
]
