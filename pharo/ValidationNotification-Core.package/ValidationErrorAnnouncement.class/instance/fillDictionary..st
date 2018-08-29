notification
fillDictionary: aDictionary

	aDictionary at: error put: ({'issuer'->issuer} asDictionary | (context ifNil: Dictionary empty)).