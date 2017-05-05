> topic quibble_all {system, keep}

  + * (or) *
  - ^respond("brit_or") 

// ?:TG *
// - ^respond("brit_tag") 

  + * (never|not) * 
  - ^respond("brit_not") 

  + * who *
  - ^respond("brit_who") 

  + * what *
  - ^respond("brit_what") 

  + * when * 
  - ^respond("brit_when") 

  + * where *
  - ^respond("brit_where") 

  + * why *
  - ^respond("brit_why") 

  + * how (many|much) *
  - ^respond("brit_howmuch") 

  + {^not("much|many")} * how *
  - ^respond("brit_how") 

  + * (because|cause) *
  - ^respond("brit_because") 

  + * (can) *
  - ^respond("brit_can") 

  + * (do) * 
  - ^respond("brit_do") 

  + * 
  - ^respond("brit_misc") 

  + * 
  - ^respond("honest_response")

< topic

