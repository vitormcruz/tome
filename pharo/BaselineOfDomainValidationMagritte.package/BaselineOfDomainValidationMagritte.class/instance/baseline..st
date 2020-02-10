baselines
"protocol: baselines"
baseline: spec 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';
		     repository: 'gitlab://vitormcruz/sandbox-st';
		
		     baseline: 'LangExtensions' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
															     loads: #(core) ];
														
		     baseline: 'SBDD' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
															     loads: #(core) ];
														
		     baseline: 'ValidationNotification' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
															     			 loads: #(core) ];
														
		     project: 'ValidationNotificationTests' copyFrom: 'ValidationNotification' with: [ spec loads: #(tests) ];
														
		     baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v4.0.6' ];
															
		     baseline: 'Magritte' with: [ spec repository: 'github://magritte-metamodel/magritte:v3.6'; 
 													     loads: #(Core) ];
												
			  package: 'Magritte-Extensions-Core' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop' ];
			  package: 'Magritte-Extensions-Tests' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'];										
		
			  package: 'DomainValidationMagritte-Core' with: [ spec requires: #('LangExtensions' 'Magritte' 'ValidationNotification') ];
			  package: 'DomainValidationMagritte-Tests' with: [ spec requires: #('DomainValidationMagritte-Core' 'SBDD' 'Mocketry' 'ValidationNotificationTests') ];
		     package: 'DomainValidationMagritte-Features' with: [ spec requires: #('LangExtensions' 'DomainValidationMagritte-Core') ];
		
 			  group: 'default' with: #('core' 'tests');
			  group: 'core' with: #('DomainValidationMagritte-Core' 'Magritte-Extensions-Core');
			  group: 'tests' with: #(core 'DomainValidationMagritte-Features' 'DomainValidationMagritte-Tests' 'Magritte-Extensions-Tests').
	].

