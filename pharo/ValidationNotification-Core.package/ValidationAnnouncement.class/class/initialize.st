initialization
initialize

	localAnnouncerFechBlock := [ ProcessLocalObservers value ifNil: [ ProcessLocalObservers value: Announcer new ] ].