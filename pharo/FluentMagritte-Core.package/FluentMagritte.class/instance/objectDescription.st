as yet unclassified
objectDescription
	<magritteDescription>
	
	"name is a required String with at most 100 chars
	 String isTheType of: #name
	MAStringDescription new acessor: #name; required: true; maxSize: 100
	
	#name isOfType: String andItIs: [:desc | desc required: true; maxSize: 100]
	
	"
	
	^ { 
			(#name isOfType: String) required: true; addCondition: [:s | s size <= 100].
		   (#salary isOfType: Number) min: 1000; required: true.
	 	   (#compute: isOfType: Message) where: {(#value isOfType: Number) min: 1 max: 100; beRequired}.
		   (#forUser:updateSalary: isOfType: Message) where: {(#user isOfType: String) required: true; addCondition: [:s | s size <= 100]. 
																	        (#salary isOfType: Number) min: 1000; required: true}.
		
	  } asMagritteContainer.
	