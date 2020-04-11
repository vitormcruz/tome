adding
add: aCPF

	(self includes: aCPF) ifTrue: [ Error signal: 'Already inserted!!' ].
	super add: aCPF.
	