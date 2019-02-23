baselines
baseline: spec 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';
		     repository: 'gitlab://vitormcruz/sandbox-st';
		
		     baseline: 'LangExtensions' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
															     loads: #(core) ];
														
		     baseline: 'SBDD' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
															     loads: #(core) ];
														
		     baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v4.0.6' ];
															
		     project: 'Magritte3' with: [ spec repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main'; 
														  className: 'ConfigurationOfMagritte3'; 
														  versionString: '3.5.1';
														  loads: #(Core) ];
		
			  package: 'DomainValidationMagritte-Core' with: [ spec requires: 'Magritte3' ];
			  package: 'DomainValidationMagritte-Tests' with: [ spec requires: #('LangExtensions' 'DomainValidationMagritte-Core' 'SBDD' 'Mocketry') ];
		     package: 'DomainValidationMagritte-Features' with: [ spec requires: #('LangExtensions' 'DomainValidationMagritte-Core') ];
 			  group: 'default' with: #('core' 'tests');
			  group: 'core' with: #('DomainValidationMagritte-Core');
			  group: 'tests' with: #(core 'DomainValidationMagritte-Features' 'DomainValidationMagritte-Tests').
	].

