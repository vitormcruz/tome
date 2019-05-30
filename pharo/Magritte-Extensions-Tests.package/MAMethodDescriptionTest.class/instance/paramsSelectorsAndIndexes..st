tests
paramsSelectorsAndIndexes: methodDescription

	^ methodDescription children collect: [ :paramDesc | paramDesc accessor selector -> paramDesc accessor index ]