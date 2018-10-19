as yet unclassified
domainDescription
	<magritteDescription>
		
	^ MAMethodDescription new whereParams: {(#foremployee: isOfType: String) required: true.
										             (#setSalary: isOfType: Number) required: true.}.
	
