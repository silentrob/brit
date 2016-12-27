> topic reason

	? * do you live
	- I live in Vancouver.

	? * i live
	- ^findLoc()

	+ i live *
	- Do you like it there?

	// What was too small?
	? * <adjective>
	- ^tooAdjective()

//	?:ENTY:color *
//	- ^colorLookup()

// ? what [else] is <adjective1>
//	- ^colorLookup()

	// my car is red
	+ my <noun1> is (<adjective1>|<adverb1>)
	- ^save(<cap1>,<cap2>)

	// what is black
	// what is too big
	? what be (<adjective1>|<adverb1>)
	- ^tooAdjective()

	// Resolve Fact 
	? is [the] <noun1> <adjective1>
	- Yes
	- No

	// ?:CH * (prefer|like) *
	// - ^makeChoice()

//	? *
//	- ^findMoney()

//	? * birthday
//	- ^findDate()

< topic