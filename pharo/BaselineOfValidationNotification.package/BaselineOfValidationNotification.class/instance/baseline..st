baselines
baseline: spec 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'github://vitormcruz/st_validation_notification/pharo'.
		
		spec baseline: 'LangExtensions' with: [ spec repository: 'github://vitormcruz/st_langextensions/pharo'; loads: #('core') ].
		
		spec package: 'ValidationNotification-Core' with: [ spec requires: 'LangExtensions' ]. 
		spec package: 'ValidationNotification-Tests' with: [ spec requires: 'ValidationNotification-Core' ].
		
		spec group: 'default' with: #('core' 'tests');
			  group: 'core' with: #('ValidationNotification-Core');
			  group: 'tests' with: #('ValidationNotification-Tests')
			
	].
		
