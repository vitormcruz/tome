baselines
baseline: spec 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';   
		repository: 'gitlab://vitormcruz/sandbox-st';   
														
		package: 'SBDD-Core';   
		package: 'SBDD-Tests' with: [ spec requires: 'SBDD-Core' ];   
		
		group: 'default' with: #('core');
		group: 'core' with: #('SBDD-Core');
		group: 'tests' with: #(core 'SBDD-Tests')			
	].
		
