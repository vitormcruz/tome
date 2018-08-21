Class {
	#name : #ValidationAnnouncementTest,
	#superclass : #TestCase,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#category : 'ValidationNotification-Tests'
}

{ #category : #'tests-issue-error' }
ValidationAnnouncementTest >> test_1_error_issued [

	| validationObserver |

	validationObserver := TestObserver new.
	self issueError: 'Test error 1'.
	self assertBlock: [ validationObserver isSuccessful not ].
	self assertBlock: [ validationObserver errors = { 'Test error 1' -> {'issuer' -> self } asDictionary } asDictionary ].
	
	
	

	
]

{ #category : #'tests-issue-error' }
ValidationAnnouncementTest >> test_N_error_issued [

	| validationObserver |

	validationObserver := TestObserver new.
	self issueError: 'Test error 1'.
	self issueError: 'Test error 2'.
	self issueError: 'Test error 3'.
	self assertBlock: [ validationObserver isSuccessful not ].
	self assert:  [ validationObserver errors = { 
															  'Test error 1' -> {'issuer' -> self } asDictionary.
															  'Test error 2' -> {'issuer' -> self } asDictionary.
															  'Test error 3' -> {'issuer' -> self } asDictionary.
														    } asDictionary ]
		  description: 'The list of errors with contexts expected were not found'.
															

	
	
	

	
]

{ #category : #'tests-registration' }
ValidationAnnouncementTest >> test_registered_and_still_used_validation_observer [

	| validationObserver |
	
	validationObserver := TestObserver new. "Hold instance so that GC cannot reclaim it."
	self assertBlock: [ ValidationAnnouncement observers isNotEmpty ].
]

{ #category : #'tests-registration' }
ValidationAnnouncementTest >> test_registered_but_unused_validation_observer [

	TestObserver new.
	self assertUntilTrue: [ Smalltalk garbageCollect.
						  		   ValidationAnnouncement observers isEmpty ] forAtMost: 1 second asMilliSeconds.
]

{ #category : #'tests-registration' }
ValidationAnnouncementTest >> test_validation_observer_registration_in_different_threads [

	| validationObserver result |
	
	validationObserver := TestObserver new.

	[ result := ValidationAnnouncement observers isEmpty ] forkAndWait.
	
   self assert: result description: 'Observers should be different across processes, but the new process do not have an empty list of observers'.
	self assert: (ValidationAnnouncement observers includes: validationObserver) 
		  description: 'The expected validation observer was not found in the current process'.
]
