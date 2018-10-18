initialization
setUp

	DVM_ClassToPlugValidations chain selectors;
										  collect: [ :s | (DVM_ClassToPlugValidations >> s) ast links ]; 
										  flattened;
										  select: #notNil;
										  do: #uninstall.
										
	validationObserver := TestObserver new.