*LangExtensions-Core
containsOnlyElementsOfType: aClass 

	^ self inject: true into: [ :result :element | result & element isKindOf: aClass ].