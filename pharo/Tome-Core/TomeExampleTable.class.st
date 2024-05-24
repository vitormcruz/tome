"
I am mostly like a very simple collection that can be represented as a table of elements with a header, so:

```
  #(Name     Age       Address  ) asHeaderFor 
- #('Jhon'    25     'Street 1' ) 
- #('Maria'   20     'Street 2' ) 
- #('Smith'   60     'Street 3' ) 
```

is equivalent to:

  |  Name   |  Age  |   Address   |
  | 'Jhon'  |  25   |  'Street 1' | 
  | 'Maria' |  20   |  'Street 2' | 
  | 'Smith' |  60   |  'Street 3' | 

I am used to represent the example clause of a scenario outline specification. For example:

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
	#name : #TomeExampleTable,
	#superclass : #Object,
	#instVars : [
		'header',
		'examples'
	],
	#category : #'Tome-Core'
}

{ #category : #'instance creation' }
TomeExampleTable class >> withHeader: aSequencableCollection [

	"See TomeExampleTable>>withHeader:"

	^ super new withHeader: aSequencableCollection.
]

{ #category : #building }
TomeExampleTable >> - aCollection [ 

	examples add: (header asFormatParametersOf: aCollection).

]

{ #category : #enumerating }
TomeExampleTable >> collect: aBlockClosure [ 
	^ examples collect: aBlockClosure .
]

{ #category : #enumerating }
TomeExampleTable >> collectWithIndex: aBlockClosure [ 
	^ examples collectWithIndex: aBlockClosure .
]

{ #category : #initialization }
TomeExampleTable >> initialize [ 

	examples := OrderedCollection new.
]

{ #category : #building }
TomeExampleTable >> withHeader: aSequencebleCollection [

	"Expect a SequenceCollection as parameter to be used as a header for the example table.
	 
	TomeExampleClause withHeader: #(name address) --> will create a header composed by 'name' and 'address'. 
	In a table format it would look like:
		| name  | address  |  --> Header
		| name1 | address1 |  
		| name2 | address2 |
	"

	header := aSequencebleCollection.
]
