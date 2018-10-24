baselines
baseline: spec 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';   
		repository: 'https://gitlab.com/vitormcruz/sandbox-st.git';   
		baseline: 'LangExtensions' with: [ spec repository: 'https://gitlab.com/vitormcruz/sandbox-st:develop'; 
												   	 loads: #('core') ];   
												
		baseline: 'SBDD' with: [ spec repository: 'https://gitlab.com/vitormcruz/sandbox-st:develop'; 
											   loads: #('core') ];   
														
		package: 'ValidationNotification-Core' with: [ spec requires: 'LangExtensions' ];   
		package: 'ValidationNotification-Tests' with: [ spec requires: 'ValidationNotification-Core' ];   
		package: 'ValidationNotification-Features' with: [ spec requires: 'ValidationNotification-Core' ];   
		
		group: 'default' with: #('core' 'tests');
			  group: 'core' with: #('ValidationNotification-Core');
			  group: 'tests' with: #(core 'ValidationNotification-Tests' 'ValidationNotification-Features')
			
	].
		
