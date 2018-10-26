*DomainValidationMagritte-Core
asGeneratedValidationMetaLink
	^ MetaLink new
		metaObject: [ :instrumentedObject :selector :arguments | 
							| vo |
							self halt.
							vo := SimpleValidationObserver new.
							self executeValidationsOn: instrumentedObject for: (arguments at: 1).
							vo isValidationSuccessful ifTrue: [ instrumentedObject perform: selector withArguments: arguments ].
													
						];
		selector: #value:value:value:;
		arguments: #(#object #selector #arguments);
		control: #instead;
		level: 0.