> topic math (add subtract plus minus time times )

  ?:NUM:expression *
  - ^evaluateExpression()

  ?:DESC:def * roman (numerial|numeral) *
  - ^numToRoman()

  ?:DESC:def * (hex|hexdecimal) *
  - ^numToHex()

  ?:DESC:def * binary *
  - ^numToBinary()

  ?:NUM:other * (missing) *
  - ^numMissing()

  ?:NUM:other * (sequence) *
  - ^numSequence()

  ? is *1 [a|an] (even|odd) [number]
  - ^evenOdd();
  
  ? is *1 [a|an] odd or an even number
  - ^evenOdd();

< topic