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
		
      baseline: 'Avatar' with: [ spec repository: 'github://vitormcruz/avatar:createBaseline'; loads: #(core) ];	
 	   baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6.1.0/source' ];
		    project: 'Buoy-Tests' copyFrom: 'Buoy' with: [ spec loads: #('Dependent-SUnit-Extensions') ];
 	   baseline: 'ZincHTTPComponents' with: [ spec repository: 'github://svenvc/zinc:v5/repository' ];
		
		package: 'Tome-Core' with: [ spec requires: #('Avatar' 'ZincHTTPComponents') ];
		package: 'Tome-Tests' with: [ spec requires: #('Tome-Core' 'Buoy-Tests') ];   
		package: 'Tome-Tests-Examples' with: [ spec requires: #('Tome-Core' 'Buoy-Tests') ];
		
		group: 'default' with: #('dev');
		group: 'core' with: #('Tome-Core');
		group: 'dev' with: #(core 'Tome-Tests' 'Tome-Tests-Examples')			
	].
		

]
