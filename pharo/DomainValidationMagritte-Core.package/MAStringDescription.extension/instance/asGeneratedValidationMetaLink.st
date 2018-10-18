*DomainValidationMagritte-Core
asGeneratedValidationMetaLink
	^ MetaLink new
		metaObject: [ :instrumentedObject :arguments | self executeValidationsOn: instrumentedObject for: (arguments at: 1) ];
		selector: #value:value:;
		arguments: #(#object #arguments);
		control: #before