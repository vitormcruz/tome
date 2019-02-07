support
captureContextFrom: aMetaLink 
	
	| contextCaptured originalMetaObject originalSelector|
	
	contextCaptured := ValueHolder new.	
	originalSelector := aMetaLink selector.
	originalMetaObject := aMetaLink metaObject.
	aMetaLink selector: 'value:value:value:value:';
				metaObject: [ :operation :instrumentedObject :arguments :context |
					contextCaptured contents: context.
					originalMetaObject perform: originalSelector withArguments: {operation. instrumentedObject. arguments. context.}.
				].
	^ contextCaptured.