support
captureContextFrom: aMetaLink 
	
	| contextCaptured |
	
	contextCaptured := ValueHolder new.	
	aMetaLink metaObject in: [ :originalMetaObject |
		aMetaLink metaObject: [ :instrumentedObject :operation :arguments :context |
			contextCaptured contents: context.
			originalMetaObject value: instrumentedObject  value: operation value: arguments value: context.
		].		
	].

	^ contextCaptured.