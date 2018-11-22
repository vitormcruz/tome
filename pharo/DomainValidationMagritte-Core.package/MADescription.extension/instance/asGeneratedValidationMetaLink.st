*DomainValidationMagritte-Core
asGeneratedValidationMetaLink
	^ MetaLink new
		metaObject: [ :instrumentedObject :operation :arguments | 
							| vo |
							vo := SimpleValidationObserver new.
							self executeValidationsOn: instrumentedObject for: (arguments at: 1).
							vo isValidationSuccessful ifTrue: [ operation value: arguments ].
													
						];
		selector: #value:value:value:;
		arguments: #(#object #operation #arguments);
		control: #instead.