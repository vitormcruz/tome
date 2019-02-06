*SBDD-Core
asColumnAssociatedWithData
	" Transforms me in a collection of column->data using the first line as the column definition"
	
	^ self allButFirst collect: [ :row | self first collectWithIndex: [ :columnName :i | columnName -> (row at: i) ]] 
			 into: OrderedCollection new