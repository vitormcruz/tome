magritte-description
domainDescription
	<magritteDescription>
		
	^ MAMethodDescription new whereParams: { MAStringDescription new accessor: #forEmployee; required: true.
										             MANumberDescription new accessor: #setSalary; required: true. }.
	
