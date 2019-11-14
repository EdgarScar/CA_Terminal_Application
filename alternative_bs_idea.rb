# Create Gameboard 
class Board_Creation

    def initialize
    end 

    def draw_board
        game_board = {
                    " 0 " => ["  1  ", "  2  ", "  3  ", "  4  ", "  5  ", "  6  ", "  7  ", "  8  ", "  9  ", "  10  "],
                    " A " => ["  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  "], 
                    " B " => ["  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  "], 
                    " C " => ["  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  "], 
                    " D " => ["  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  "], 
                    " E " => ["  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  "], 
                    " F " => ["  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  "], 
                    " G " => ["  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  "], 
                    " H " => ["  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  "], 
                    " I " => ["  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  "], 
                    " J " => ["  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  ", "  ~  "], 
                    }
        game_board.each do |label, array|
            print "\n"
            print label 
            array.each do |column| 
                print column
            end 
            print "\n"
        end 
    end 
end 


class Player 
    attr_reader :name

    def initialize(name)
        @name = name 
    end 

    def shoot(row, column)
        @row = row
        @column = column 
        puts "Aye Aye Captain"
        puts "Setting sights on #{row}#{column}..."
    end 
end 


puts "Battleships"
puts "What would you like to do:"
puts "[1] - Play"
puts "[2] - Quit"
selection = gets.chomp.to_i

case selection 
    when 1
        puts "Enter player name:"
        input = gets.chomp
        player1 = Player.new(input)
        puts "Welcome to battle Captain #{player1.name}"
        newboard = Board_Creation.new 
        newboard.draw_board


    when 2
        puts "Goodbye"
    else 
        puts "No valid"
end 
