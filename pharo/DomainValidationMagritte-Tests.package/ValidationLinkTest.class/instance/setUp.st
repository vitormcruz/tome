initialization
setUp

	DVM_ClassToLinkValidations chain selectors;
										  collect: [ :s | (DVM_ClassToLinkValidations >> s) ast links ]; 
										  flattened;
										  select: #notNil;
										  do: #uninstall.
										
	validationObserver := TestObserver new.