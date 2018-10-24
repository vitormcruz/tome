notification
fillDataFrame: aDataFrame

	aDataFrame at: errorString put: ({'issuer'->issuer} asDictionary | (context ifNil: Dictionary empty)).