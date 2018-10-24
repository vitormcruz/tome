baselines
baseline: spec 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';
		     repository: 'https://gitlab.com/vitormcruz/sandbox-st.git';
		
		     baseline: 'LangExtensions' with: [ spec repository: 'https://gitlab.com/vitormcruz/sandbox-st:develop'; 
															     loads: #(core) ];
															
		     project: 'Magritte3' with: [ spec repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main'; 
														  className: 'ConfigurationOfMagritte3'; 
														  versionString: '3.5.1';
														  loads: #(Core) ];
		
			  package: 'DomainValidationMagritte-Core' with: [ spec requires: 'Magritte3' ];
			  package: 'DomainValidationMagritte-Tests' with: [ spec requires: 'LangExtensions' ];
		     package: 'DomainValidationMagritte-Features' with: [ spec requires: 'LangExtensions' ];
 			  group: 'default' with: #('core' 'tests');
			  group: 'core' with: #('DomainValidationMagritte-Core');
			  group: 'tests' with: #(core 'DomainValidationMagritte-Features' 'DomainValidationMagritte-Tests')	
	].

