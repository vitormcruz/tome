Class {
	#name : #BaselineOfLangExtensions,
	#superclass : #BaselineOf,
	#category : 'BaselineOfLangExtensions'
}

{ #category : #baselines }
BaselineOfLangExtensions >> baseline: spec [ 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'https://vitormcruz@bitbucket.org/vitormcruz/unnamed_mess_of_stuff'.
		spec package: #'LangExtensions-Core'.
		spec package: #'LangExtensions-Tests' "with: [ spec requires: 'LangExtensions-Core']".
		
"		spec 
			group: 'default' with: #('core' 'tests');
			group: 'core' with: #('LangExtensions');
			group: 'tests' with: #('LangExtensions-Tests') 
"			
	].


]
