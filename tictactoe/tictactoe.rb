class Player

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

    def name
        @name
    end

    def symbol
        @symbol
    end
end

class Board

    def initialize
        @fields = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    end

    def display
        @fields.each do |row|
            print "|"
            row.each { |e| print e + "|"}
            puts
        end
    end

    def set(symbol, field)
        field -= 1
        @fields[field/3][field%3] = symbol
    end

    def field_numbers
        puts "Field numbers:"
        (1..9).each do |num|
            print num
            print " "
            puts if num%3 == 0
        end
    end

    def is_field_empty?(field)
        board_field(field) == " "
    end

    def victory?(symbol, field)
        field -=1
        row = field/3
        col = field%3
        if @fields[row].count(symbol) == 3
            return true
        elsif @fields[0][col] == symbol && @fields[1][col] == symbol && @fields[2][col] == symbol
            return true
        elsif row == col
            if @fields[0][0] == symbol && @fields[1][1] == symbol && @fields[2][2] == symbol
                return true
            end
        elsif @fields[0][2] == symbol && @fields[1][1] == symbol && @fields[2][0] == symbol
            return true
        else
            false
        end
    end

    def tie?
        empty_fields = 0
        @fields.each do |row|
            empty_fields += row.count(" ")
        end
        empty_fields == 0
    end

    private

    def board_field(field)
        field -=1
        @fields[field/3][field%3]
    end
end

class Game

    NUMBER_OF_PLAYERS = 2

    def initialize(players)
        @board = Board.new
        @winner = nil
        @players = players
    end

    def call
        i=0
        while @winner == nil
            current_player = @players[i]
            chosen_field = iterate(current_player)
            display_state
            @winner = current_player if won?(current_player.symbol, chosen_field)
            if tie?
                break
            end
            i = (i+1)%NUMBER_OF_PLAYERS
        end
        if @winner == nil
            puts "It's a tie!"
        else
            puts "#{current_player.name} won the game! Congratulations!"
        end
    end

    private

    def display_state
        @board.display
    end

    def move(symbol, field)
        @board.set(symbol, field)
    end

    def navigation_display
        @board.field_numbers
    end

    def is_move_allowed?(field)
        if !(1..9).include?(field)
            puts "Choose a number between 1 and 9"
            return false 
        elsif !@board.is_field_empty?(field)
            puts "This field is already occupied. Choose different one."
            navigation_display
            return false
        else
            true
        end
    end

    def iterate(player)
        puts "#{player.name}'s turn. Choose a field."
        navigation_display
        chosen_field = gets.chomp.to_i
        while !is_move_allowed?(chosen_field)
            chosen_field = gets.chomp.to_i
        end

        move(player.symbol, chosen_field)
        chosen_field
    end

    def won?(symbol, field)
        @board.victory?(symbol, field)
    end

    def tie?
        @board.tie?
    end

end


players_list = []
puts "Insert the name of Player X:"
name1 = gets.chomp
players_list << Player.new(name1, "x")

puts "Insert the name of Player O:"
name2 = gets.chomp
players_list << Player.new(name2, "o")

game = Game.new(players_list)

game.call