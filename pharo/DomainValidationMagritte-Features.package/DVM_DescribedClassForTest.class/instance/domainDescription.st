magritte-description
domainDescription
	<magritteDescription>
		
	^ MAMethodDescription new whereParams: { MAStringDescription new accessor: #foremployee:; required: true.
										             MANumberDescription new accessor: #setSalary:; required: true. }.
	
