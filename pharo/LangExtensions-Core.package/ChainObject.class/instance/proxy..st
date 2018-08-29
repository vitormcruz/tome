accessing
proxy: anObject

	target ifNotNil: [ ^ target proxy: anObject ].
	target := anObject.
	