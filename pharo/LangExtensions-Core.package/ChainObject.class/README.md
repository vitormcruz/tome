I am a proxy object used to chain mesasges send in order to make code more readable using cascades instead of parenthesis. Be aware that I am not thread safe.

Example:

((#(1 2 3 4 5 6 7 8 9) select: [ :num | num even ]) 
				   collect: [ :a | a / 2]).
							
						
#(1 2 3 4 5 6 7 8 9) chain select: [ :num | num even ];
				             collect: [ :a | a / 2].