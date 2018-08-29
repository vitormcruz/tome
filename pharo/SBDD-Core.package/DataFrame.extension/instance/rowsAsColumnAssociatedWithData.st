*SBDD-Core
rowsAsColumnAssociatedWithData
	" Transforms a row in a collection of column->data "
	
	^ self collect: [ :row | self columnNames collectWithIndex: [ :columnName :i | columnName -> (row at: i) ]] 
			 into: OrderedCollection new