#Task: Write a program which will ask for a starting year and an ending year,
#and then puts all of the leap years between them (and including them,
#if they are also leap years). Leap years are years divisible by four (like 1984 and 2004).
#However, years divisible by 100 are not leap years (such as 1800 and 1900) unless they are divisible by 400.

puts "Starting year:"
year1 = gets.chomp.to_i
puts "Ending year:"
year2 = gets.chomp.to_i

if (year1 < year2)
  counter = 0
  year = year1

  while year != year2+1
    if year%4 == 0
      if year%100 != 0
        counter +=1
      else
        if year%400 == 0
          counter +=1
        end
      end
    end
    year+=1
  end
else
  puts "Starting year has to be smaller than ending year"
end
if counter == 1
  puts "There was 1 leap year between year #{year1} and #{year2}"
else
  puts "There were #{counter} leap years between year #{year1} and #{year2}"
end
