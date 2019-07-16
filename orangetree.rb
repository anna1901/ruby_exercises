class OrangeTree

  def initialize
    @height = 0.5
    @age = 0
    @orangeCount = 0
  end

  def height
    @height
  end

  #when one year passes, a tree grows and produces some fruits
  def oneYearPasses
    @orangeCount = 0
    @age += 1
    if @age>15
      die
    end
    @height += 0.5
    if @age > 3
      @orangeCount += 5
      if @age > 6
        @orangeCount +=3
      end
    end
  end

  def countTheOranges
    @orangeCount
  end

  def pickAnOrange
    if @orangeCount > 0
      puts "That was a delicious orange"
      @orangeCount -= 1
    else
      puts "There are no more oranges to pick this year"
    end
  end

end

orangeTree = OrangeTree.new

puts orangeTree.height
6.times { orangeTree.oneYearPasses }
puts orangeTree.countTheOranges
puts orangeTree.height
