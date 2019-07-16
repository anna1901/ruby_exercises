#Task: write a program that takes undefined number of words from user
#until they press enter, and then prints them in an anphabetical order.
puts "Type as many words as you want. When you're done press enter"

array = []
word = gets.chomp

while word != ''
  array.push word
  word = gets.chomp
end

if array.empty?
  puts "You didn't put any words"
else
  array.each {|word| word.downcase!}
  array.sort!
  array.each do
    |word| puts "#{word}"
  end
end
