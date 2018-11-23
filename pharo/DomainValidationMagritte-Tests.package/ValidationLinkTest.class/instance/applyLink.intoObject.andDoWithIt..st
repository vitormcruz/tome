support
applyLink: aMetaLink intoObject: anObject andDoWithIt: aBlockClosure 
	"Apply a link to the given object and execute aBlockClosure with the object as param. If the block provided is binary then I will pass the 
	context holders the instrumented object that will hold the last method context executed."

	| contextHolder |
	
	contextHolder := self captureContextFrom: aMetaLink.
	(DVM_ClassToLinkValidations >> #p1:) ast link: aMetaLink.
	aBlockClosure cull: anObject cull: contextHolder.