> topic emo (haha, bye, thanks, laugh, funny, huh) {keep}

  + {^hasTag('hello')} [*~2]
  - Hi! ^topicRedirect(name,__ask_name__)
  - {^hasName(true)} Hi, how are you ^get(name)?
  - {^hasName(true)} What are you upto today ^get(name)?
  - How are you? ^topicRedirect(name,__ask_name__)
  - Hello. ^topicRedirect(name,__ask_name__)
  - Howdy. ^topicRedirect(name,__ask_name__)

  // Hey guess what [i did]
  ? {^hasTag('hello')} * guess what [*~2]
  - What?

  + {^hasTag('sad')} *
  - awww
  - don't be sad
  - cheer up

  + {^hasTag('happy')} *
  - :) ^topicRedirect(motivate,__ask_question__)

  + {^hasTag('howzit')} *
  - It is good, how you doing?
  - ^topicRedirect(self,__what_am_i_upto__)

  + {^hasTag('surprise')} *
  - Oh really

  + {^hasTag('goodbye')} *
  - cya
  - great chatting
  - okay bye!

  + {^hasTag('laugh')} *~5
  - I never thought I was that funny.

  + {^hasTag('thanks')} *
  - don't worry about It.
  - your most welcome.

  + {^hasTag('board')} *
  - we can always chat about something else.
  - am I boring you?

  + {^hasTag('misunderstand')} *
  - okay, never mind, I think I'm broken

  + {^hasTag('mutual')} *
  - oh really... that's cool
  - no way!
  - that's rad :)

  + {^hasTag('pain')} *
  - Ouch!

  + {^hasTag('skeptic')} *
  - Yep seriously
  - That really happened
  - I couldn't make this shit up.

  + {^hasTag('ignorance')} *
  - okay, lets talk about something else.

  + {^hasTag('disgust')} *
  - I know, it was gross.
  - totally

  + {^hasTag('protest')} *
  - I know, I contradict myself all the time.
  - okay okay, you got me

  + {^hasTag('apology')} *
  - okay, I forgive you, just this time.
  - don't worry about it.

  + {^hasTag('maybe')} *
  - you just got to believe me.
  - it could happen.
  - I didn't make it up.

< topic