utility
addACommonMessageNamed: aString toFeatureSubclassWithTextBody: aMehodBodyString

	self addMessageNamed: aString toClassSideOfClass: FeatureSubclassForTest WithTextBody: aMehodBodyString andPragmas: #(createdForTest).