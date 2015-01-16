> topic wordlogic (letters characters rhymes syllables syllable opposite define)

	+ how many (letters|chars|characters) [are] [there] [in] [the word] *~3
	- ^wordLength(<cap2>)

	+ what [letter] (comes|is) (after|before) *~1
	- It is ^letterLookup()

	// What is the nth letter in the alphabet?
	// What is the first letter in the alphabet?
	// What is the last letter in the alphabet?
	+ what [is] [the] * letter (in|of) the [english] alphabet
	- ^letterLookup()

	+ what [number] (comes|is) (after|before) *1
	- I think it is ^nextNumber().

	+ what [word] (rhyme|rhymes) with *1
	- ^rhymes(<cap2>) rhymes with <cap2>

	+ how many syllables in *~3
	- There are ^syllable(<cap1>) in '<cap1>'.

	+ what is the opposite of *~2
	- The opposite of <cap1> is ^oppisite(<cap1>).


	// Define the term.
	? * define [a] *1
	- ^wordnetDefine()
	
	? * definition of *1
	- ^wordnetDefine()

< topic