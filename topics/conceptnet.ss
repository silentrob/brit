> topic cnet (used for is a put in located see find )

  // What whould I use to put a nail into a wall
  ? * put a *
  - ^putA()

  // Concept net
  
  ?:WH * i do with a *
  - ^usedFor()
  
 //      what use is a taxi?
 // what would I use a taxi for?
  ?:WH * use [is] a *1 [for]
  - ^usedFor()

  ?:WH * is a * used for
  - ^usedFor()
  
  // What is a thing
  ? what is a *~2
  - ^isA()

  // What is NOUN
  ? what be *1
  - ^isA()

  // name something you could find at a beach
  + * name * (find|see) (on|at|in) [a|the] *~2
  - ^locatedAt(<cap3>)

  ?:WH * (find|see) (on|at|in) [a|the] *~2
  - ^locatedAt(<cap3>)

    % ^locatedAt(<cap3>)
    + * what else
    - ^locatedAt()


< topic