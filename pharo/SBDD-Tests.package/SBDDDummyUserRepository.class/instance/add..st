adding
add: aNewUser

	(self anySatisfy: [ :user | user cpf = aNewUser cpf ])
		ifTrue: [ Error signal: 'A User with this CPF number was already inserted!!' ].
		
	super add: aNewUser