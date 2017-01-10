> topic facts {system}

  + *1 (moved|went|journeyed|travelled|travel) [back] to the *1
  - ^createUserFact(<cap1>, 'locatedAt', <cap3>)

  // Fact tests
  // My friend Albert eats rocks
  // Albert eat rock
  + my *~2 <name1> [likes to] <verb1> *1
  - ^createUserFact(<cap2>,<cap3>,<cap4>)

  // I kicked my brother Dustin
  + i <verb1> [my|a] ~family_members [named|called] <name1>
  - ^createUserFact(i,<cap1>,<cap3>)^createUserFact(i,<cap1>,<cap2>)^createUserFact(<cap3>,isa,<cap2>)

  // Charlie is my dog
  + <name1> is my <noun2>
  - ^createUserFact(<cap1>,isa,<cap2>)

  // My mother is Elizabeth
  // My wifes name is Shelly
  // My brothers name is Dustin
  + my ~family_members [name] be <name1>
  - ^createUserFact(<cap2>,isa,<cap1>)

  // My cat is Freddy
  // my fish is called Harold
  + my <noun1> is [called|named] <name1>
  - ^createUserFact(<cap2>,isa,<cap1>)


  // The football was kicked by Fred.
  + * <noun1> be <verb2> by <name1> *
  - ^createUserFact(<cap1>,<cap2>,<cap3>)
   
  // my father like to_play_tennis
  + my ~role likes to play *1 *
  - ^createUserFact(has,role,<cap2>)^createUserFact(<cap1>,like,to_play_<cap2>)^createUserFact(<cap1>,like,<cap2>)^createUserFact(<cap1>,play,<cap2>)

  // my dad likes to go hunting on the weeends
  + my ~role like to go *1 *
  - ^createUserFact(has,role,<cap2>)^createUserFact(<cap1>,like,to_go_<cap2>)^createUserFact(<cap1>,like,<cap2>)^createUserFact(<cap1>,go,<cap2>)

  // My friend Chris likes to play football.
  + my friend <name1> likes to play *1
  - ^createUserFact(my,friend,<cap1>)^createUserFact(<cap1>,like,to_play_<cap2>)^createUserFact(<cap1>,like,<cap2>)^createUserFact(<cap1>,play,<cap2>)


  // my aunt likes baseball
  // aunt like baseball
  + [my] ~role likes *1
  - ^createUserFact(<cap1>,like,<cap2>)

  + i have *1 (kid|kids|child|children|babys|babies|teenager|son|sons|daughter|daughters|cousin|friends|brothers) *
  - ^createUserFact(<cap1>,have,<cap3>)

  // I like ice cream
  // I like popcorn
  + i (like|love|prefer) *~2
  - ^createUserFact(i,like,<cap2>)

  + * haning out with * <name>
  - ^createUserFact(my,friend,<cap1>)^save(friend,<cap1>)

  + my favorite color is *1
  - ^createUserFact(favorite, color, <cap1>)

  + * <name1> * likes * play *1
  - ^save(<cap1>,<cap2>)

  // I have a friend name __
  + * friend [named] <name1> *
  - ^createUserFact(my,friend,<cap1>)^save(friend,<cap1>)

  // I have an enemy named Grady
  // + i have an *1 named <name1>
  // Grady equal enemy

  //the ball was hit by Ingrid
  // Ingrid hit ball
  // ball fact hit
  // ball ~placepreposition Ingrid ???

  //rats will be eaten by mice
  // mouse eat rat ????
  // rat fact eat
  // rat ~placepreposition mouse

  //the collie sat
  // collie fact sit

  //the pooch sat on the mat
  // pouch fact sit
  // pooch ~placepreposition mat

  //the eagle flew after tomorrow
  // eagle fact fly
  // eagle ~timepreposition tomorrow
  //the beagle was born in 1955


  //Jerome has brown hair
  // Jerome doown hair
  // brown adjective hair

  //the blue box is on the ground
  // box ~placepreposition ground
  // blue adjective box

  //the coffin is red
  // red adjective coffin

< topic