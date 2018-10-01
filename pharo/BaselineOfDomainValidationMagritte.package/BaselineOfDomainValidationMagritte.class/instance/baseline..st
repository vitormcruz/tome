baselines
baseline: spec 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'https://vitormcruz@bitbucket.org/vitormcruz/unnamed_mess_of_stuff'.
		spec package: #'DomainValidationMagritte'.
		spec package: #'DomainValidationMagritte-Features' with: [ spec requires: 'LangExtensions-Core'].
		
		spec group: 'default' with: #('core' 'tests');
			  group: 'core' with: #('ValidationNotification-Core');
			  group: 'tests' with: #('ValidationNotification-Tests')	
	].

