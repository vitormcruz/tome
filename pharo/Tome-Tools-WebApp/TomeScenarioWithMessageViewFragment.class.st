Class {
	#name : #TomeScenarioWithMessageViewFragment,
	#superclass : #TomeScenarioViewFragment,
	#category : #'Tome-Tools-WebApp-ViewFragment'
}

{ #category : #rendering }
TomeScenarioWithMessageViewFragment >> body: html [

   html div
      class: 'definition-body-with-message-container';
      with: [
         html div
            class: 'scenario-text-body';
            with: [ super body: html ].

         html div
            class: self messageCssBody;
            with: [ html preformatted: self preformatedMessageText ] 
		]
]

{ #category : #rendering }
TomeScenarioWithMessageViewFragment >> messageCssBody [

	self shouldBeImplemented
]

{ #category : #accessing }
TomeScenarioWithMessageViewFragment >> preformatedMessageText [

	self shouldBeImplemented.
]
