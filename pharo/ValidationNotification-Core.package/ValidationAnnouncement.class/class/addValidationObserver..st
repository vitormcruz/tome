adding
addValidationObserver: validationObserver

	self subclasses do: [ :subclass | 
		self announcer weak when: subclass send: #handleAnnouncer: to: validationObserver.
	].