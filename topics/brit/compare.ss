> topic compare (shorter, taller, older, younger)

  // Tom is taller than Mary and Tom is shorter than Joan.
  + [if] <name1> [is|be] [more|less] <adjectives> (then|than) <name2> ~extensions <names> [is|be] <adjectives> (then|than) <name3>
  - ^createFact(<cap1>,<cap2>,<cap4>) ^createFact(<cap6>,<cap7>,<cap9>)

  // Compare concepts
  // Tom is more tall than Mary
  + [if] <name1> [is|be] [more|less] <adjectives> (then|than) <name2>
  - ^createFact(<cap1>,<cap2>,<cap4>)

  // Who is the tallest
  // Who is the older A or B
  // Do you know who is the tallest
  ? *~3 who *~2 <adjectives> [<name1> or <name2>]
  - ^resolveAdjective() 

  // Which of them is the oldest
  ? which *~4 <adjectives> [<name1> or <name2>]
  - ^resolveAdjective() 

< topic