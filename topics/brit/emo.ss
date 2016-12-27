> topic emo (haha, bye, thanks, laugh, funny, huh) {keep}

  + ~emohello [*~2]
  - Hi! ^topicRedirect(name,__ask_name__)
  - {^hasName(true)} Hi, how are you ^get(name)?
  - {^hasName(true)} What are you upto today ^get(name)?
  - How are you? ^topicRedirect(name,__ask_name__)
  - Hello. ^topicRedirect(name,__ask_name__)
  - Howdy. ^topicRedirect(name,__ask_name__)

  // Hey guess what [i did]
  ? ~emohello guess what [*~2]
  - What?

  + ~emosad
  - awww
  - don't be sad
  - cheer up

  + ~emohappy
  - :) ^topicRedirect(motivate,__ask_question__)

  + ~emohowzit
  - It is good, how you doing?
  - ^topicRedirect(self,__what_am_i_upto__)

  + ~emosurprise
  - Oh really

  + ~emogoodbye
  - cya
  - great chatting
  - okay bye!

  + ~emolaugh *~3
  - I never thought I was that funny.

  + ~emothanks
  - don't worry about It.
  - your most welcome.

  + ~emobored
  - we can always chat about something else.
  - am I boring you?

  + ~emomisunderstand *
  - okay, never mind, I think I'm broken

  + ~emomutual
  - oh really... that's cool
  - no way!
  - that's rad :)

  + ~emopain
  - Ouch!

  + ~emoskeptic
  - Yep seriously
  - That really happened
  - I couldn't make this shit up.

  + ~emoignorance
  - okay, lets talk about something else.

  + ~emodisgust
  - I know, it was gross.
  - totally

  + * ~emoprotest *
  - I know, I contradict myself all the time.
  - okay okay, you got me

  + ~emoapology *
  - okay, I forgive you, just this time.
  - don't worry about it.

  + ~emomaybe
  - you just got to believe me.
  - it could happen.
  - I didn't make it up.

< topic