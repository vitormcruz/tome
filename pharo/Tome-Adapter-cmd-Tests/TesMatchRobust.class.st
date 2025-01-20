Class {
	#name : #TesMatchRobust,
	#superclass : #TestCase,
	#instVars : [
		'args'
	],
	#category : #'Tome-Adapter-cmd-Tests'
}

{ #category : #running }
TesMatchRobust >> setUp [
	super setUp.

   args := {'Package1'. 'Package2'. 'Package3.*'. 'OtherPackage'}. 
]

{ #category : #tests }
TesMatchRobust >> testHandleRegexError [

	self deny: ('Invalid[Regex' matchRobust: 'Package1')
]

{ #category : #tests }
TesMatchRobust >> testHandleRegexErrorAndMatchExact [


	self assert: ('Invalid[Regex' matchRobust: 'Invalid[Regex')
]

{ #category : #tests }
TesMatchRobust >> testMatchExactString [


	self assert: ('Package1' matchRobust: 'Package1')

]

{ #category : #tests }
TesMatchRobust >> testMatchExactStringWithMinorDifference [


	self deny: ('Package11' matchRobust: 'Package1')

]

{ #category : #tests }
TesMatchRobust >> testMatchWithRegex [ 

	self assert: ('Package3.*' matchRobust: 'Package3Extra')
]

{ #category : #tests }
TesMatchRobust >> testNoMatch [

	self deny: ('Package-1' matchRobust: 'NoMatch').
]

{ #category : #tests }
TesMatchRobust >> testNoMatchSimilar [

	self deny: ('Package-1' matchRobust: 'Package-11').
]
