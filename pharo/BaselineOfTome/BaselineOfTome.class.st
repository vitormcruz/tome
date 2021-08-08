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
		
 	   baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6.1.0/source' ];
										
		project: 'Buoy-Tests' copyFrom: 'Buoy' with: [ spec loads: #('Dependent-SUnit-Extensions') ];
		
 	   baseline: 'LangExtensions' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
											 		 loads: #(core) ];
														
		package: 'Tome-Core' with: [ spec requires: #('LangExtensions') ];
		package: 'Tome-Tests' with: [ spec requires: #('Tome-Core' 'Buoy-Tests') ];   
		
		group: 'default' with: #('dev');
		group: 'core' with: #('Tome-Core');
		group: 'dev' with: #(core 'Tome-Tests')			
	].
		

]
