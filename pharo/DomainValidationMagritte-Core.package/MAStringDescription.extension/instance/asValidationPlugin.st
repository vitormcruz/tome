*DomainValidationMagritte-Core
asValidationPlugin
	^ MetaLink new metaObject: (ValidationForString newUsingStringDescription: self);
						selector: #doGeneratedValidation:;
						arguments: {#arguments};
						control: #before.