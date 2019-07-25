baselines
baseline: spec 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';
			  repository: 'gitlab://vitormcruz/sandbox-st/';
			  baseline: 'LangExtensions' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
													 		     loads: #(tests) ];
														
			  baseline: 'SBDD' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
													 loads: #(tests) ];
														
			  baseline: 'ValidationNotification' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
															             loads: #(tests) ];
														
			  baseline: 'DomainValidationMagritte' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
															             loads: #(tests) ];

			  package: 'Magritte-Extensions-Core' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'];
			  package: 'Magritte-Extensions-Tests' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'];
			  package: 'Sunset' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'];
			  package: 'Universe-tests' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'].
		
		spec group: 'default' with: #('core');
			  group: 'core'    with: #('LangExtensions' 'SBDD' 'ValidationNotification' 'DomainValidationMagritte' 
											  'Sunset' 'Universe-tests' 'Magritte-Extensions-Core' 'Magritte-Extensions-Tests').
	].

