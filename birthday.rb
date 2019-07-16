#Ask what year a person was born in, then the month, then the day.
#Figure out how old they are and give them a big SPANK! for each birthday they have had.

bday = Time.new(1993, 1, 19, 12, 5)

age = Time.now.year - bday.year - (bday.month > Time.now.month && 1 || 0)

puts "You are #{age} years old!"

year = bday.year
while year < Time.now.year
  year+=1
  puts "SPANK!"
end
