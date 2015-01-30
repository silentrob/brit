> topic date (week day month season winter summer spring morning noon night)

  + what is the date [today]
  - ^getDate()

  + what (is|will) the date (be) tomorrow
  - ^getDateTomorrow()

  ? what (is|will be) tomorrow *~2 date
  - ^getDateTomorrow()

  + what (is|will be) the date tomorrow
  - ^getDateTomorrow()

  + what day will it be tomorrow
  - ^getDateTomorrow()

  + what month [of the year] is this
  - It is ^getMonth().

  + what is the [next] [previous] [first] [last] month [of the year]
  - It is ^getMonth().

  + what [is the] season [is it]
  - It is currently ^getSeason() here.

  + is it (winter|spring|summer|fall) (winter|spring|summer|fall) (winter|spring|summer|fall) [or winter|or spring|or summer|or fall] where you live
  - It is ^getSeason().

  + what [is] [the] time [right] [is] [it] [now]
  - ^getTime()

  ? what be the time *~1 (midnight|noon)
  - Is that a trick question? It would be 12.

  ? is it morning [noon] or night
  - ^getTimeOfDay()

  + what day of the week is it
  - ^getDOW()

  + how many days [are there] in a year
  - There are 365 days in a year.

  + how many days [are there] in a leap year
  - There are 366 days in a year.

  + how about in a leap year
  - There are 366 days in a year.

  ? How many days in *1
  - Thirty I think.
  - There is 31 days in <cap1>.

< topic