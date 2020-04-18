as yet unclassified
validateInExecution

	"I am a scenario build strategy, so I should not be used to execute a scenario"
	
	self error: 'I am an instance of SbddFeature created for scenario building, but you have tried to use me in execution. Something is wrong.'