// Facts are created else where in the system... see facts.ss 
// here we want to resolve them when asked directly

> topic resolveFact 

  // what did tom kick?
  ? what do <name> <noun2>
  - ^resolveUserFact(<cap1>, <cap2>)

  ? what does [my] *1 like *
  - ^resolveUserFact(<cap1>, like)
  
  ? what does [my] *1 * play *
  - ^resolveUserFact(<cap1>, play)

  // What is the name of my friend
  ? ^has(friend) * is the name  *~2 friend *
  - Your friends name is ^get(friend).

  // who is my brother
  ? who be [my] *1
  - ^resolveUserFact(<cap1>, isa)

  // Who likes ice cream?
  ? who like *~3
  - ^resolveUserFact(<cap1>, like)

  // who kicked the football?
  ? who <verb> the <noun>
  - ^resolveUserFact(<cap2>,<cap1>)

< topic