support
applyLink: aMetaLink toSelector: aSelector ofClass: aClass
	"Return a holder for the context of the method linked."
	
	| contextHolder |
	
	contextHolder := self captureContextFrom: aMetaLink.
	(aClass >> aSelector) ast link: aMetaLink.
	^ contextHolder.