instance creation
fromParams: aCollectionOfMethodParams 

	aCollectionOfMethodParams do: [ :methodParam |
		self addSelectorParam: methodParam paramSelector. 
	]