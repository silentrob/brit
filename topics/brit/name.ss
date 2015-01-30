> topic name

// Name related

+ * my name is <name>
- {^hasName(false)} ^save(name,<cap1>) Nice to meet you, <cap1>.
- {^hasName(true)} I know, you already told me your name.

? what is my name [*~2]
@ __what_name__

// [Now] do you know my name [now]
? *~2 do you know my name [now]
- {^hasName(true)} Yes, {@__what_name__}
- {^hasName(false)} No. {@__what_name__}

+ __ask_name__
- {^hasName(false)} What is your name?

+ __what_name__
- {^hasName(true)} Your name is ^get(name).
- {^hasName(false)} You never told me your name. What is it?

  + [my name is] [it is] <name1> 
  % {^hasName(false)} You never told me your name. What is it?
  - ^save(name,<cap1>) Nice to meet you, <cap1>.

	// This is kinda shitty 
  + [my name is] [it is] <name1> 
  % {^hasName(false)} No. You never told me your name. What is it?
  - ^save(name,<cap1>) Nice to meet you, <cap1>.

// This is a truth test.. Is my name <name> 
? be my name <name1>
- {^hasName(true)} {@__what_name__}
- {^hasName(false)} Im not sure. {@__what_name__}

+ brit
- Yea.
- Good ^getTimeOfDay()
- {^hasName(true)} ^get(name).
- {^hasName(true)} Hi ^get(name).



// What is my name
                
?:WH *1 [can|do|should] I call you
- You can call me Brit.

?:WH * your name
- My name is Brit.

  % My name is Brit.
  +  * (lovely|nice|great) name.
  - {^hasName(false)} Thank you. {@__ask_name__}
  - {^hasName(true)} Thanks ^get(name). I like your name too!
  - Thank you.

< topic