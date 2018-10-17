*DomainValidationMagritte-Core
asGeneratedValidationMetaLink

	^ MetaLink new metaObject: [ :objectUnderValidation :describedObject | 
										 self properties asGeneratedValidations inject: true into: [:resultValidation :validationBlock | 
				  																									  resultValidation | (validationBlock value: objectUnderValidation value: describedObject) ]];
						selector: #value:value:;
						arguments: #(#arguments #object);
						control: #before.