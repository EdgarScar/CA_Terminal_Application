size = 3 
MIN_ROW = 1
MIN_COL = 1
MAX_ROW_HORIZ = 10
MAX_COL_HORIZ = 10 - (size-1) 
MAX_COL_VERT = 10 
MAX_ROW_VERT = 10 - (size-1)
VERTICAL_ORIENTATION = 1
HORIZONTAL_ORIENTATION = 2

class Ship 
attr_reader :coordinates

    def initialize()
        @size = 3
        @orientation = rand(VERTICAL_ORIENTATION..HORIZONTAL_ORIENTATION) 
    end 

    def get_start_coordinates() 
        if @orientation == 1
            @start_coor = [rand(MIN_ROW..MAX_ROW_VERT), rand(MIN_COL..MAX_COL_VERT)]
            return @start_coor
        elsif @orientation == 2
            @start_coor = [rand(MIN_ROW..MAX_ROW_HORIZ), rand(MIN_COL..MAX_COL_HORIZ)]
            return @start_coor
        else 
        end 
    end 

    def get_coordinates()
        @coordinates = []
        row = @start_coor[0]
        col = @start_coor[1]
        if @orientation == 1
            coor_second = [row + 1, col]
            coor_third = [row + 2, col]
            @coordinates.push(@start_coor)
            @coordinates.push(coor_second)
            @coordinates.push(coor_third)
        elsif @orientation == 2
            coor_second = [row, col + 1]
            coor_third = [row, col + 2]
            @coordinates.push(@start_coor)
            @coordinates.push(coor_second)
            @coordinates.push(coor_third)
        else 
        end 
    end 
end 

class Board
    def initialize()
    @game_board = [
        ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
        ["A", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
        ["B", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
        ["C", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
        ["D", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
        ["E", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
        ["F", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
        ["G", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
        ["H", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
        ["I", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
        ["J", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
        ]
    end 

    def draw_board()      
        @game_board.each do |array|
            print "\n"
            print array
            print "\n"
        end 
    end  

    def draw_board_hidden()      
        @game_board.each do |array|
            printed_array = array
            array.each do |index|
                if index == "S"
                    printed_array[array.index(index)] = "~"
                end
            end
            print "\n"
            print printed_array
            print "\n"
        end
    end
            
    def draw_ship(ship)
        ship.coordinates.each do |coor|
            row = coor[0]
            col = coor[1]
            @game_board[row][col] = "S"
        end 
    end 

    def shoot()
        puts "Enter your aiming coordinates (ie. A4)"
        aim = gets.chomp.split(//,2)
        row = aim[0]
        col = aim[1].to_i
        if row == "A"
            row = 1
        elsif row == "B"
            row = 2
        elsif row == "C"
            row = 3
        elsif row == "D"
            row = 4
        elsif row == "E"
            row = 5
        elsif row == "F"
            row = 6
        elsif row == "G"
            row = 7
        elsif row == "H"
            row = 8
        elsif row == "I"
            row = 9
        elsif row == "J"
            row = 10
        else
        end 
        if @game_board[row][col] == "~"
            @game_board[row][col] = "O"
        elsif @game_board[row][col] == "S"
            @game_board[row][col] = "X"
        elsif @game_board[row][col] == "X"
            puts "You've already aimed here"
        else 
        end 
    end 

end 

class Player 
    attr_reader :name

    def initialize(name)
        @name = name 
    end 

end 

puts "Battleships"
puts "What would you like to do:"
puts "[1] - Play"
puts "[2] - Quit"
selection = gets.chomp.to_i

case selection 
    when 1 
            puts "Enter player 1 name:"
            input1 = gets.chomp
            first_player = Player.new(input1)
            puts "Welcome to battle Captain #{first_player.name}"
            puts "Launching your ships..."
            sleep 2
            puts "Captain #{first_player.name}, this is your ship"
            ship1 = Ship.new()
            ship1.get_start_coordinates()
            ship1.get_coordinates()
            player1 = Board.new 
            player1.draw_ship(ship1)
            player1.draw_board()
            player1.draw_board_hidden()

            puts "Enter player 2 name:"
            input2 = gets.chomp
            second_player = Player.new(input2)
            puts "Welcome to battle Captain #{second_player.name}"
            puts "Launching your ships..."
            sleep 2
            puts "Captain #{second_player.name}, this is your ship"
            ship2 = Ship.new()
            ship2.get_start_coordinates()
            ship2.get_coordinates()
            player2 = Board.new 
            player2.draw_ship(ship2)
            player2.draw_board()

            puts "Captain #{first_player.name}, fire away"

            player2.shoot()
            player2.draw_board()

            puts "Captain #{second_player.name}, fire away"

            player1.shoot()
            player1.draw_board()


    when 2
        puts "Goodbye"
    else 
        puts "No valid"
end 
