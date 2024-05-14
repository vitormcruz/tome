Class {
	#name : #TomeFeatureSelectionView,
	#superclass : #WAComponent,
	#instVars : [
		'featureFilter'
	],
	#category : #'Tome-Tools-WebApp'
}

{ #category : #rendering }
TomeFeatureSelectionView >> filterFeatures [

	^ TomeFeature subclasses select: [ :feature | feature featureName asLowercase beginsWith: featureFilter asLowercase ]
]

{ #category : #initialization }
TomeFeatureSelectionView >> initialize [ 
	
	super initialize.
	featureFilter := ''.
]

{ #category : #rendering }
TomeFeatureSelectionView >> renderContentOn: html [

	| featuresClasses |
	
	html div class: 'form-container'.
	html form: [
		html span class: 'select-feature-label'; with: 'Filter features: '.
		html textInput value: featureFilter; callback: [ :inputedText | featureFilter := inputedText ].
		html submitButton class: 'filter-features-button'; text: 'apply'; callback: [  ].
		html submitButton class: 'filter-features-button'; text: 'clear'; callback: [ featureFilter := '' ].

		html paragraph.
		
		html div class: 'list-features-container'; with: [
			html div class: 'list-header line-item'; with: 'Features'.
			featuresClasses := self filterFeatures.
			featuresClasses doWithIndex: [ :featureClass :i |
				html div class: 'feature-item'; with: [ 
					html anchor 
						callback: [ self answer: featureClass. ];
						with: featureClass featureName.
				].
				
				featuresClasses size ~= i ifTrue: [ 
					html div class: 'line-item'.
				].
			]
		]
	]
]

{ #category : #hooks }
TomeFeatureSelectionView >> style [

	^ '
	
	span.select-feature-label{
		font-size: 1.2rem;
	}
	
	.filter-features-button{
		margin-left: .5rem
	}
	
	div.list-features-container{
		background-color: #d3d3d338;
		font-size: 1.2rem;
		border-style: solid;
		border-width: thin;
		padding-top: 0.8rem;
		padding-bottom: 0.8rem;
		margin-top: 1.7rem;
		display: grid;
		grid-gap: 0.4rem;
		width: 50%;
	}
	
	div.list-header{
		padding-bottom: .5rem;
		font-weight: bold;
	}
	
	div.list-header{
		padding-left: .5rem;
	}
	
	div.feature-item {
		padding-left: 1rem;
	}
	
	div.feature-item a{
		text-decoration: none !important;
	}
	
	div.line-item{
		border-bottom-style: solid;
		border-width: thin;
	}
	
		
	
'
]
