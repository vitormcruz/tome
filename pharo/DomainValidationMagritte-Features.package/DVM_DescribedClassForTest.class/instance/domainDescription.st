as yet unclassified
domainDescription
	<magritteDescription>
		
	^ MAMessageDescription new whereParams: {(#foremployee: isOfType: String) required: true.
										             (#setSalary: isOfType: Number) required: true.}.
	
