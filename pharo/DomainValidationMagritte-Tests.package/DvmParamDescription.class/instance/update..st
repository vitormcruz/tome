updating
update: aDescription

	(aDescription access isNotNil & aDescription paramSelector isNotNil) ifTrue: [ 
		ParamDescriptionError signal: 'Params description of a Method description should not define an accessor. Use paramSelector only.'
	]