*LangExtensions-Core-removing
removeIfPresent: anObject
"Removes anObject returning itself if it is present, do nothing and return nil if it is absent"

	^ self remove: anObject ifAbsent: [].