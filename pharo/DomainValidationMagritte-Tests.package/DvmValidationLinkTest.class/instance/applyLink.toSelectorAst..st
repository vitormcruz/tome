support
applyLink: aMetaLink toSelectorAst: aSelectorAst
	"Return a holder for the context of the method linked."
	
	| contextHolder |
	
	contextHolder := self captureContextFrom: aMetaLink.
	aSelectorAst link: aMetaLink.
	^ contextHolder.