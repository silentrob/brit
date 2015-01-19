> topic cnet (used for is a put in located see find )

  // What whould I use to put a nail into a wall
  ? * put a *
  - ^putA()
  
  ?:WH * i do with a *
  - ^usedFor()

 //      what use is a taxi?
 // what would I use a taxi for?
  ?:WH * use [is] a *1 [for]
  - ^usedFor()

  ? what are * used for
  - ^usedFor()

  ?:WH * is a * used for
  - ^usedFor()
  - Im not telling you!
  
  // What is a thing
  ? what is a *~2
  - ^isA()

  ? what is a *~2
  - ^topicRedirect(explore,__explore_concept__)

  // What is NOUN
  ? what be *1
  ^topicRedirect(explore,__explore_concept__)
  - ^isA()

  // name something you could find at a beach
  + * name * (find|see) (on|at|in) [a|the] *~2
  - ^locatedAt(<cap3>)

  // What would you find at the beach
  ?:WH * (find|see) (on|at|in) [a|the] *~2
  - ^locatedAt(<cap3>)

    % ^locatedAt(<cap3>)
    + * what else
    - ^locatedAt()

< topic