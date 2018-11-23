*DomainValidationMagritte-Core
asGeneratedValidationMetaLink
	^ MetaLink new
		metaObject: [ :instrumentedObject :operation :arguments :context | 
			| vo |
			vo := SimpleValidationObserver new.
			self executeValidationsOn: instrumentedObject for: (arguments at: 1) fromContext: context.
			vo isValidationSuccessful ifTrue: [ ^ operation value ] 
		];
		selector: #value:value:value:value:;
		arguments: #(#object #operation #arguments #context);
		control: #instead