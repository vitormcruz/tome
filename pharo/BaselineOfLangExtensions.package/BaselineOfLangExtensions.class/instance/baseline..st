baselines
baseline: spec 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'github://vitormcruz/st_langextensions/pharo'.
		spec package: 'LangExtensions'.
		spec package: 'LangExtensions-Tests' with: [ spec requires: 'LangExtensions'].
		
		spec group: 'default' with: #('core' 'tests');
			  group: 'core' with: #('LangExtensions');
			  group: 'tests' with: #('LangExtensions-Tests') 
	].

