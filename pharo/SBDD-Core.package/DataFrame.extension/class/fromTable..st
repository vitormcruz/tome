*SBDD-Core
fromTable: aSequencebleCollection

	^ (self fromRows: aSequencebleCollection allButFirst) columnNames: (aSequencebleCollection first).
	