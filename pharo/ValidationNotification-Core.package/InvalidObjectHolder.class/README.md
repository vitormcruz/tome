I represent an object created in an invalid state. 

I store the object created with the errors reported so that my clients can inspect both:

| invalidObjectHolder |

invalidObjectHolder := InvalidObjectHolder forObject: 1 withErrors: #('error').
invalidObjectHolder errors. "Inspect errors so that it can be shown on screen or logged."

"Get the object created but that got some validation problem. 
Clients my attempt to recover from failure."
invalidObjectHolder underliyngObject. 


I also play as the object atempted to be created only to signal errors for users that try to use it.