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
		
 	   baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6.1.0/source'; 
											 		 loads: #(Deployment) ];
		
 	   baseline: 'LangExtensions' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
											 		 loads: #(core) ];
														
		package: 'Tome-Core' with: [ spec requires: #('LangExtensions' 'Buoy') ];
		package: 'Tome-Tests' with: [ spec requires: 'Tome-Core' ];   
		
		group: 'default' with: #('core');
		group: 'core' with: #('Tome-Core');
		group: 'dev' with: #(core 'Tome-Tests')			
	].
		

]
