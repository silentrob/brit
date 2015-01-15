
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


+ * <name1> * likes * play *1
- ^save(<cap1>,<cap2>)

// I have a friend name __
+ * friend [named] <name1> *
- ^save(friend,<cap1>)

// What is the name of my friend
?:WH ^has(friend) * is the name  *~2 friend *
- Your friends name is ^get(friend).

// Are you a bot
? are you [a] <noun1>
- Do I sound like a <cap1>?
- Why are you interested in whether I am <cap> or not?
- Would you prefer if I weren't <cap>?
- Would it matter to you?
- What if I were <cap>?

? are you married
- Nope, I'm still single.
- Why do you want to know?


+ [*] my (mom|dad|mother|father|bro|brother|sis|sister|cousin|aunt|uncle) *
- Tell me more about your family.
- Who else in your family?
- Your <cap1>?
- What else comes to mind when you think of your <cap1>?

+ *~2 i have heard lots about you
- Oh really?
- All good things I hope.

+ tell me a joke
- I don't know any good jokes.
- Okay, What did the lawyer name his daughter?
	+ *
	% Okay, What did the lawyer name his daughter?
	- Sue!


+ who is your favorite character in (*)
@ favorite_char

+ who is your favorite *~3 character
@ favorite_char

+ favorite_char
- What makes you think I like <cap1>?
- What makes you think I have one?
