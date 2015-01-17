> topic:system ~quibble_all

  + * (or) *
  - ^respond(~brit_or) 

  ?:TG *
  - ^respond(~brit_tag) 

  + * (never|not) * 
  - ^respond(~brit_not) 

  + * who *
  - ^respond(~brit_who) 

  + * what *
  - ^respond(~brit_what) 

  + * when * 
  - ^respond(~brit_when) 

  + * where *
  - ^respond(~brit_where) 

  + * ~why *
  - ^respond(~brit_why) 

  + * how (many|much) *
  - ^respond(~brit_howmuch) 

  + ^not(much|many) * how *
  - ^respond(~brit_how) 

  + * (because|cause) *
  - ^respond(~brit_because) 

  + * (can) *
  - ^respond(~brit_can) 

  + * (do) * 
  - ^respond(~brit_do) 

  + * 
  - ^respond(~brit_misc) 

  + * 
  - ^respond(~honest_response ) 

< topic


> topic:system ~honest_response
  
  + * ~noanswer *   
  - OK. You disagree with me.
  - Why are you disagreeing with me?
  - Do you think I care if you disagree?
  - OK. So we disagree.
  - No? Why don't you agree with me?
  - No? And why not?
  - No? Are you sure?
  - No? How come?
  - No? How interesting. 
  - No? Please explain.
  - No? Why do you say that?
  - Why no?
  - Why not?
  - Care to explain further?
  - I won't argue about this.

  // yes
  + * ~yesanswer * 
  - OK. We agree. 
  - So nice that we agree. 
  - Are we actually agreeing? 
  - You agree with me? 
  - Yes. 
  - All right!
  - Are you sure?
  - Cool.
  - You seem certain.
  - You seem really positive.
  - Indeed.

  
  + good [answer]
  - Thanks

  // Will you please play a game with me?
  ?:YN:ENTY:sport * you * play * i
  - No.
  - Not today.

  // How old is the ...
  ?:NUM:period * old *
  - Really old.
  - I'm not sure exactly but I'm sure it is old.

  ? are you <adjective1>
  - Maybe a little.
  - No
  - Do I look ^lowercase(<cap1>)?

  // when did 
  ?:NUM:date *
  - I'm not sure, when?
  - I have no idea when that happened.


  // hello (greeting)
  + (~emohello|~emohowzit)
  - Hello
  - Ola
  - I'm good.

  // bye
  + ~emogoodbye
  - It was great chatting
  - Okay, talk to you again soon.

  // I'm going to go now
  + I *~3 (leave you|go) *~2  (now|soon)
  @ ~emogoodbye

  // are you for real
  + * ~emoskeptic *
  - Why do you doubt this?

  // thanks
  + * ~emothanks *
  - You're welcome.

  // I'm sorry
  + ~emoapology
  - Apology accepted.

  // ugh
  + * ~emodisgust *
  - Indeed.
  - Truly.
  - Yes.
  - Pretty awful.
  - Gross.

  // beats me
  + * ~emoignorance *
  - Many are the things we don't know.

  // please 
  + ~emobeg
  - You don't need to beg.

  // I'm confused
  + ~emomisunderstand
  - What is it you don't understand?
  - I'm not sure I can be any clearer.
  - I'm sorry. I can't explain it better.
  

  // but you said
  + * ~emoprotest *  
  - So I changed my mind.

  // me too
  // + (~emomutual) $$intent = i_mutual 

  // I love you
  + ^not(correct|right) i *~2 ~goodness *~2 you
  @ i_like_you

  // you are sweet
  + ^not(correct|right) you * are *~2 ~goodness
  @ i_like_you

  + i_like_you
  - Thank you.
  - I like you too.
  - Have you always liked me?
  - I'm glad. 
  - I enjoy talking to you.
  // b: (~why) Because I like to talk and you are providing me an opportunity to do so.


  // you are stupid
  + ^not(wrong|~bodily_states) you * are *~2 ~badness
  @ i_dislike_you

  // I hate you
  + ^not(wrong) I *~2 ~badness *~2 you 
  @ i_dislike_you

  + i_dislike_you
  - So be it. 
  - I don't like you much either. 
  - You keep this up and I'll hang up. 
  - Why do you dislike me? 
  - That's not news from you. 
  - I'm sorry to hear that.

  // I like peas
  // + (!? << ~mainsubject=I  ~goodness  ~mainobject >> ) $$intent = i_like_something  

  // I hate peas
  // + (!? ~mainsubject=I < * ~badness < * ~mainobject ) $$intent = i_dislike_something   
  

  // user perspective

  // what color is my shirt?
  ? * (mine|my) * 
  @ my_question
  
  + my_question
  - Did you tell me already and I forgot?
  - I'm sorry. I don't know.
   // b: (~yes ) Sorry. I forgot. 
   // b: (~no ) Good. I thought I had forgotten. 
   // c: (often) More and more these days.

  // people like my coat
  // ? people * my * <verbs>
  // @ my_fact


  // Am I the best player?
  ? * (I|me]) *
  @ i_question

  + i_question
  - I don't know that much about it. 
  - I don't know.
  - Beats me.
  - How would I know
  - I'm sorry. I don't know. 

  // I think the world is flat.
  + I (believe|think|hope) * [take on] *
  @ i_opinion 

  + i_opinion 
  - That's nice.
  - Lots of people have that opinion.
  - You really think that?
  - That's a common opinion.
  - I share that opinion.
  - So you have an opinion.
 
  // I eat worms
  + I * <verb1> *~2 <nouns> 
  @ i_fact

  + i_fact  
  - Cool.
  - Okay.
  - Indeed.
  - That's nice.
  - Fine.
  - Right.
  - Yup.

< topic

