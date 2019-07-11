#Task: Write a Deaf Grandma program.
#Whatever you say to grandma (whatever you type in),
#she should respond with  HUH?!  SPEAK UP, SONNY!,
#unless you shout it (type in all capitals).
#If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938!
#You can't stop talking to grandma until you shout BYE.


puts "Talk to your granny".upcase

sentence = gets.chomp
while sentence!="BYE"
  if sentence!=sentence.upcase
    puts "HUH?!  SPEAK UP, SONNY!"
  else
    puts "NO, NOT SINCE #{1930+rand(21)}"
  end
  sentence = gets.chomp
end
