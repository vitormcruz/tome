*DomainValidationMagritte-Core
asGeneratedValidationMetaLink
	^ MetaLink new
		metaObject: (DvmValidationLink forDescription: self);
		selector: #validateOperation:ofObject:sentWith:andRunningWithingContext:;
		arguments: #(#operation #object #arguments #context);
		control: #instead