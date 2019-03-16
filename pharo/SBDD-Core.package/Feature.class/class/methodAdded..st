method change dealing
methodAdded: aMethodAddedAnnouncement
	| methodAdded |

	methodAdded := aMethodAddedAnnouncement methodAdded.
   [ methodAdded methodClass inheritsFrom: Feature class ], 
	[ methodAdded isAScenarioOutline ]
   ifAnyFalse: [^ self].

	methodAdded valueWithReceiver: (methodAdded methodClass instanceSide ) arguments: #().
	
	