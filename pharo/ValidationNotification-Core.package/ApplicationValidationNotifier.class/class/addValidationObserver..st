adding
addValidationObserver: validationObserver

	ValidationAnnouncement subclasses do: [ :subclass | 
		localAnnouncerFechBlock value value weak when: subclass send: subclass defaultSelectorListener to: validationObserver.
	].