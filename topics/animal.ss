> topic animal (cow cat dog horse pig animal)

  + where does a *1 live
  - ^aLocation(<cap>)

  + what is a (male|female) *1 called
  - A <cap1> <cap2> is called a ^aGender(<cap1>,<cap2>)

  + what is a group of *1 called
  - ^aGroup(<cap>)

  + what is a baby *1 called
  - aBaby(<cap>)

  + ^not(egg) ~dairyitems comes from what animal
  - A cow.

< topic
