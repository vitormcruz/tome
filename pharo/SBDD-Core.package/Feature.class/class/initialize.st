initialize - event
initialize
	| systemAnnouncer |
	
	systemAnnouncer := SystemAnnouncer uniqueInstance.
	systemAnnouncer weak subscribe: MethodAdded send: #methodAdded: to: Feature