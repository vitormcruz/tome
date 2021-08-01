Class {
	#name : #BaselineOfTome,
	#superclass : #BaselineOf,
	#category : #BaselineOfTome
}

{ #category : #baselines }
BaselineOfTome >> baseline: spec [ 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';   
		repository: 'gitlab://vitormcruz/sandbox-st';   
		
 	   baseline: 'LangExtensions' with: [ spec repository: 'github://vitormcruz/tome:develop'; 
											 		 loads: #(core) ];
														
		package: 'Tome-Core' with: [ spec requires: 'LangExtensions' ];
		package: 'Tome-Tests' with: [ spec requires: 'Tome-Core' ];   
		
		group: 'default' with: #('core');
		group: 'core' with: #('Tome-Core');
		group: 'dev' with: #(core 'Tome-Tests')			
	].
		

]
