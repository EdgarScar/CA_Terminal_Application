MIN_ROW = 1
MIN_COL = 1
MAX_ROW_HORIZ = 10
MAX_COL_VERT = 10 
VERTICAL_ORIENTATION = 1
HORIZONTAL_ORIENTATION = 2

class Ship 
attr_reader :coordinates

    def initialize(size)
        @size = size
        @orientation = rand(VERTICAL_ORIENTATION..HORIZONTAL_ORIENTATION)
        self.set_coordinates()
    end

    def set_coordinates() 
        if @orientation == 1
            @max_row_vert = 10 - (@size-1)
            @start_coor = [rand(MIN_ROW..@max_row_vert), rand(MIN_COL..MAX_COL_VERT)]
        elsif @orientation == 2
            @max_col_horiz = 10 - (@size-1) 
            @start_coor = [rand(MIN_ROW..MAX_ROW_HORIZ), rand(MIN_COL..@max_col_horiz)]
        else 
        end 
        @coordinates = []
        row = @start_coor[0]
        col = @start_coor[1]
        @coordinates.push(@start_coor)
        if @orientation == 1
            for i in 1..(@size-1)
                coor_additional = [row + i, col]
                @coordinates.push(coor_additional)
            end
        elsif @orientation == 2
            for i in 1..(@size-1)
                coor_additional = [row, col + i]
                @coordinates.push(coor_additional)
            end 
        else 
        end 
    end 
end 

class Board
attr_reader :game_end_counter

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
    @game_end_counter = 3
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
            printed_array = array.dup
            array.each do |index|
                if index == "S"
                    printed_array[printed_array.index(index)] = "~"
                end
            end
            print "\n"
            print printed_array
            print "\n"
        end
    end
            
    def draw_ship(ship_size)
        placed_ship = false
        until placed_ship 
            ship = Ship.new(ship_size)

            # ship is a boolean that check if ship is clashing with another ship
            ship_clash = false

            ship.coordinates.each do |coor|
                if @game_board[coor[0]][coor[1]] == "S"
                    ship_clash = true
                end
            end

            if !ship_clash
                #put on board
                ship.coordinates.each do |coor|
                    row = coor[0]
                    col = coor[1]
                    @game_board[row][col] = "S"
                end
                placed_ship = true
            else 
                puts "Clash!"
            end
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
            @game_end_counter -= 1
        elsif @game_board[row][col] == "X" || @game_board[row][col] == "O"
            puts "You've already aimed here"
        else 
        end 
    end 
        

end 

class Player
    attr_reader :name

    def initialize()
        puts "What is your character name?"
        name = gets.chomp
        @name = name 
        puts "Welcome to battle Captain #{self.name}"
    end 
end 

puts "Battleships"
puts "What would you like to do:"
puts "[1] - Play"
puts "[2] - Quit"
selection = gets.chomp.to_i

case selection 
    when 1 
        first_player = Player.new()
        puts "Launching your ships..."
        sleep 2
        puts "Captain #{first_player.name}, this is your ship"
        player1 = Board.new 
        player1.draw_ship(3)
        player1.draw_ship(3)
        player1.draw_ship(4)
        player1.draw_ship(4)
        player1.draw_board()

        second_player = Player.new()
        puts "Launching your ships..."
        sleep 2
        puts "Captain #{second_player.name}, this is your ship"
        player2 = Board.new 
        player2.draw_ship(3)
        player2.draw_ship(3)
        player2.draw_ship(4)
        player2.draw_ship(4)
        player2.draw_board()

        until player1.game_end_counter == 0 || player2.game_end_counter == 0

            puts "Captain #{first_player.name}, fire away"

            player2.shoot()
            player2.draw_board_hidden()
            if player1.game_end_counter == 0 || player2.game_end_counter == 0
                break
            end 

            puts "Captain #{second_player.name}, fire away"

            player1.shoot()
            player1.draw_board_hidden()
            if player1.game_end_counter == 0 || player2.game_end_counter == 0
                break
            end 
        end 

    when 2
        puts "Goodbye"
    else 
        puts "No valid"
end 
