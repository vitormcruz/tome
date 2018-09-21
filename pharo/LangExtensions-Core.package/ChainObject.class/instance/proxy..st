accessing
proxy: aSubject
	"Sets the initial chained object that will be proxied by this object"

	"delegates proxy: message to the subject if it was already set, that way proxy: messages can be chained too"
	subject ifNotNil: [ ^ subject proxy: aSubject ].
	subject := aSubject.
	