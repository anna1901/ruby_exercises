#Task: Write a Deaf Grandma program.
#Whatever you say to grandma (whatever you type in),
#she should respond with  HUH?!  SPEAK UP, SONNY!,
#unless you shout it (type in all capitals).
#If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938!
#You can't stop talking to grandma until you shout BYE three times in a row.

puts "Talk to your granny".upcase

sentence = gets.chomp
counter = 0

while counter == 0
  while sentence == "BYE" and counter!=2
    puts "HUH?!  SPEAK UP, SONNY!"
    counter+=1
    sentence = gets.chomp
  end
  while sentence!="BYE"
    counter = 0
    if sentence!=sentence.upcase
      puts "HUH?!  SPEAK UP, SONNY!"
    else
      puts "NO, NOT SINCE #{1930+rand(21)}"
    end
    sentence = gets.chomp
  end
end
