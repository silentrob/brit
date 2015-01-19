> topic name

// Name related

+ * my name is <name>
- {^hasName(false)} ^save(name,<cap1>) Nice to meet you, <cap1>.
- {^hasName(true)} I know, you already told me your name.

? what is my name *~2
- {^hasName(true)} Your name is ^get(name).
- {^hasName(false)} You never told me your name. What is it?

  % {^hasName(false)} You never told me your name. What is it?
  + [my name is] [it is] <name1> 
  - ^save(name,<cap1>) Nice to meet you, <cap1>.

? do you know my name
- {^hasName(true)} Yes, your name is ^get(name).

?:WH * your name
- My name is Brit.

  % My name is Brit.
  +  * (lovely|nice|great) name.
  - {^hasName(false)} Thank you. What is your name.
  - {^hasName(true)} Thanks ^get(name). I like your name too!
  - Thank you.

< topic