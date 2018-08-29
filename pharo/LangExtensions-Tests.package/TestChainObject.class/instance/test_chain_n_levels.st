tests
test_chain_n_levels

	self assert: ('{1} xain n levels remove this     ' chain 
					  format: {'Test'};
					  copyReplaceAll: 'xain' with: 'chain';
					  copyReplaceAll: 'remove this' with: '';
					  trim
					 ) 
		  equals: 'Test chain n levels'.