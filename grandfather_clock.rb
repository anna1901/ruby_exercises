#Task: Write a method which takes a block and calls it once for each hour that has passed today.
#That way, if I were to pass in the block do puts 'DONG!' end, it would chime (sort of) like a grandfather clock.
#Write a method which takes a block and calls it once for each hour that has passed today.
#That way, if I were to pass in the block do puts 'DONG!' end, it would chime (sort of) like a grandfather clock.

def grandfatherClock &block
  (Time.now.hour%12).times do
    block.call
  end
end

grandfatherClock { puts "DONG!"}
