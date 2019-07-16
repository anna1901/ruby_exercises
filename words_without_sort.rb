#Task: write a program that takes undefined number of words from user
#until they press enter, and then prints them in an anphabetical order.
#You can't use the method sort.
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
  (0...array.length).each do |i|
    (i+1...array.length).each do |j|
      if array[j].downcase < array[i].downcase
        x = array[i]
        array[i] = array[j]
        array[j] = x
      end
    end
  end
  array.each do
    |word| puts word
  end
end
