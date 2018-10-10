as yet unclassified
domainDescription
	<magritteDescription>
		
	^ MAMessageDescription new whereParams: {(#foremployee: isOfType: Number) min: 1000; required: true.
										             (#setSalary: isOfType: Number) required: true.}.
	
