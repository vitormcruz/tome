Class {
	#name : #TomeFeatureWebApp,
	#superclass : #WAComponent,
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

{ #category : #rendering }
TomeFeatureWebApp >> renderContentOn: html [

	| result |
	
	result := TomeFeatureExamples suite run.
	
	html text: (String streamContents: [ :stream | result printOn: stream ]).
]
