initialize - event
initialize
	"| systemAnnouncer |
	
	systemAnnouncer := SystemAnnouncer uniqueInstance.
	systemAnnouncer weak subscribe: MethodAdded send: #methodAdded: to: Feature.
	systemAnnouncer weak subscribe: MethodModified send: #methodChanged: to: Feature."