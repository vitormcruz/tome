initialization
setUp

	DvmClassToLinkValidations chain selectors;
										  collect: [ :s | (DvmClassToLinkValidations >> s) ast links ]; 
										  flattened;
										  select: #notNil;
										  do: #uninstall.
										
	validationObserver := TestObserver new.