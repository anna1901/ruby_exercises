class Player

    @@players = []

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
        @@players << self
    end

    def name
        @name
    end

    def symbol
        @symbol
    end

    def self.players
        @@players
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

    def fields_numbers
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
        elsif
            if @fields[0][2] == symbol && @fields[1][1] == symbol && fields[2][0] == symbol
                return true
            end
        else
            false
        end
    end

    private

    def board_field(field)
        field -=1
        @fields[field/3][field%3]
    end
end

class Game

    NUMBER_OF_PLAYERS = 2

    def initialize
        @board = Board.new
        @winner = nil
    end

    def call
        i=0
        while @winner == nil
            current_player = Player.players[i]
            puts "#{current_player.name}'s turn. Choose a field."
            self.navigation_display
            chosen_field = gets.chomp.to_i
            while !is_move_allowed?(chosen_field)
                puts "This field is already occupied. Choose different one."
                self.navigation_display
                chosen_field = gets.chomp.to_i
            end

            move(current_player.symbol, chosen_field)
            self.state
            @winner = current_player if self.won?(current_player.symbol, chosen_field)
            i = (i+1)%NUMBER_OF_PLAYERS
        end
        puts "#{current_player.name} won the game! Congratulations!"
    end

    def state
        @board.display
    end

    def move(symbol, field)
        @board.set(symbol, field)
    end

    def navigation_display
        @board.fields_numbers
    end

    def is_move_allowed?(field)
        @board.is_field_empty?(field)
    end

    def won?(symbol, field)
        @board.victory?(symbol, field)
    end

end



puts "Insert the name of Player X:"
name1 = gets.chomp
player1 = Player.new(name1, "x")

puts "Insert the name of Player O:"
name2 = gets.chomp
player2 = Player.new(name2, "o")

game = Game.new

game.call