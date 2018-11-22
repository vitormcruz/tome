baselines
baseline: spec 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';   
		repository: 'gitlab://vitormcruz/sandbox-st';   
		baseline: 'DataFrame' with: [ spec repository: 'github://PolyMathOrg/DataFrame:master'; 
												   	 loads: #('Core') ];   
														
		package: 'SBDD-Core' with: [ spec requires: 'DataFrame' ];   
		package: 'SBDD-Tests' with: [ spec requires: 'SBDD-Core' ];   
		
		group: 'default' with: #('core');
		group: 'core' with: #('SBDD-Core');
		group: 'tests' with: #(core 'SBDD-Tests')			
	].
		
