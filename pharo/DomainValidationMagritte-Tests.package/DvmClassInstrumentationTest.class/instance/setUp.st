running
setUp
										
	validationObserver := TestObserver new.
	
	DvmDescribedClassForInstrumentation chain selectors;
										  collect: [ :s | (DvmDescribedClassForInstrumentation >> s) ast links ]; 
										  flattened;
										  select: #notNil;
										  do: #uninstall.
										
	DvmDescribedClassForInstrumentation initialize.