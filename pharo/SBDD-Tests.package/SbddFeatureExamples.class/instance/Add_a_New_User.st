scenario outline
Add_a_New_User

	<scenario>

	^ self scenario: 'Add a new User'
      		      def: 'Given a new user named "Sofia"
        			      When I try to register her as a user
           	         Then she is registery successfully'
         		   run: [ :userName | userRepository add: (SBDDDummyUser new name: userName) ].