Class {
	#name : #BaselineOfSBDD,
	#superclass : #BaselineOf,
	#category : 'BaselineOfTome'
}

{ #category : #baselines }
BaselineOfSBDD >> baseline: spec [ 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';   
		repository: 'gitlab://vitormcruz/sandbox-st';   
		
 	   baseline: 'LangExtensions' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
											 		 loads: #(core) ];
														
		package: 'SBDD-Core' with: [ spec requires: 'LangExtensions' ];
		package: 'SBDD-Tests' with: [ spec requires: 'SBDD-Core' ];   
		
		group: 'default' with: #('core');
		group: 'core' with: #('SBDD-Core');
		group: 'tests' with: #(core 'SBDD-Tests')			
	].
		

]
