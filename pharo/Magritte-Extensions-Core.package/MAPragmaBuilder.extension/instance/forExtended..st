*Magritte-Extensions-Core
forExtended: anObject
	| cache |
	cache := MADynamicDescriptionCache value.
	
	MADynamicDescriptionCache use: cache during: [
		^ cache at: anObject ifAbsentPut: [ self buildExtended: anObject cache: cache ] ]