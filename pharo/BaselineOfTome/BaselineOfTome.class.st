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
		
		baseline:'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside:v3.5.5/repository' ];
			project: 'Seaside3-Prod' copyFrom: 'Seaside3' with: [ spec loads: #('Core' 'Zinc') ];
			project: 'Seaside3-Dev' copyFrom: 'Seaside3' with: [ spec loads: #(default) ];
			
		baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v7.0.2' ];
		
		package: 'Tome-Core' with: [ spec requires: #('Avatar') ];
		package: 'Tome-Tests' with: [ spec requires: #('Tome-Core' 'Buoy-Tests') ];   
		package: 'Tome-Examples' with: [ spec requires: #('Tome-Core' 'Buoy-Tests') ];
		package: 'Tome-Adapter-cmd' with: [ spec requires: #('Tome-Core') ];
		package: 'Tome-Adapter-cmd-Tests-DummyFeatures' with: [ spec requires: #('Tome-Core') ];
		package: 'Tome-Adapter-cmd-Tests' with: [ spec requires: #('Tome-Core' 'Tome-Adapter-cmd-Tests-DummyFeatures' 'Mocketry') ];
		package: 'Tome-Tools-WebApp' with: [ spec requires: #('Tome-Core') ];
		package: 'Tome-Config' with: [ spec requires: #('Tome-Tools-WebApp' 'Tome-Core') ];
		
		group: 'default' with: #('dev');
		group: 'core' with: #('Tome-Config' 'Tome-Adapter-cmd' 'Tome-Examples' 'Seaside3-Prod');
		group: 'test' with: #(core 'Tome-Tests' 'Tome-Adapter-cmd-Tests' 'Mocketry');
		group: 'dev' with: #(core test 'Seaside3-Dev')
	].
		

]
