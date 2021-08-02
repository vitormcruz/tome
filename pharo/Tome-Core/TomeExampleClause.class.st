"
Class: TomeExampleClause
                                                                                                    

I am mostly like a very simple collection and I am used to represent the example clause of a scenario outline specification.
For example:

Scenario: Every user must be 18 ears old or more
•	Given John is ""<age>"" years old
•	When John is registered
•	Then ""<result>""
Examples:
   | age |  result  |
   | 17  |  Fail    |
   | 18  |  Success |
   | 19  |  Success |

I represent the three examples used to instantiate the following three scenarios:

(1) Scenario: Every user must be 18 ears old or more (17, Fail)
- Given John is ""17"" years old
- When John is registered
- Then ""Fail""

(2) Scenario: Every user must be 18 ears old or more (18, Success)
- Given John is ""17"" years old
- When John is registered
- Then ""Fail""

(3) Scenario: Every user must be 18 ears old or more (19, Success)
- Given John is ""17"" years old
- When John is registered
- Then ""Fail""

"
Class {
	#name : #TomeExampleClause,
	#superclass : #Object,
	#instVars : [
		'header',
		'examples'
	],
	#category : #'Tome-Core'
}

{ #category : #'instance creation' }
TomeExampleClause class >> withHeader: exampleHeader [

	^ super new withHeader: exampleHeader.
]

{ #category : #'var accessors' }
TomeExampleClause >> - aCollection [ 

	examples add: (header asFormatParametersOf: aCollection).

]

{ #category : #enumerating }
TomeExampleClause >> collect: aBlockClosure [ 
	^ examples collect: aBlockClosure .
]

{ #category : #enumeration }
TomeExampleClause >> do: aBlockClosure [ 
	examples do: aBlockClosure.
]

{ #category : #initialization }
TomeExampleClause >> initialize [ 

	examples := OrderedCollection new.
]

{ #category : #'var accessors' }
TomeExampleClause >> withHeader: aSequencebleCollection [

	"Expect a SequenceCollection as parameter to be used as a header for the example table.
	 
	TomeExampleClause withHeader: #(name address) --> will create a header composed by 'name' and 'address'. 
	In a table format it would look like:
		| name  | address  |  --> Header
		| name1 | address1 |  
		| name2 | address2 |
	"

	header := aSequencebleCollection.
]
