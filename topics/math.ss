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

< topic