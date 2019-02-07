running
setUp
										
	validationObserver := TestObserver new.
	
	DvmDescribedClassForTest chain selectors;
										  collect: [ :s | (DvmDescribedClassForTest >> s) ast links ]; 
										  flattened;
										  select: #notNil;
										  do: #uninstall.
										
	DvmDescribedClassForTest initialize.