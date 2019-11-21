require "tty-progressbar"
require "colorize"
require "colorized_string"
require "tty-font"
font = TTY::Font.new(:doom)

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
    @game_end_counter = 17
    end 

    def draw_board()      
        @game_board.each do |array|
            print "\n"
            array.each do |element| 
                if element == "~"
                    print "  " + element.colorize(:blue) + "  "
                elsif element == "S"
                    print "  " + element.colorize(:yellow).on_yellow + "  "
                elsif element == "X"
                    print "  " + element.colorize(:red).on_red + "  "
                elsif element == "O"
                    print "  " + element.colorize(:light_green) + "  "
                else
                    print "  " + element.colorize(:white) + "  "
                end
            end
            print "\n"
        end 
        sleep 5
        system("clear")
        sleep 1
    end  

    def draw_board_hidden()   
        system("clear")   
        @game_board.each do |array|
            printed_array = array.dup
            array.each do |index|
                if index == "S"
                    printed_array[printed_array.index(index)] = "~"
                end
            end
            print "\n"
            printed_array.each do |new_index|
                if new_index == "~"
                    print "  " + new_index.colorize(:blue) + "  "
                elsif new_index == "X"
                    print "  " + new_index.colorize(:red).on_red + "  "
                elsif new_index == "O"
                    print "  " + new_index.colorize(:light_green) + "  "
                else
                    print "  " + new_index.colorize(:white) + "  "
                end
            end
            print "\n"
        end
        sleep 5
        system("clear")
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
            end
        end 
    end 

    def shoot()
        sleep 1
        puts "Enter your aiming coordinates (ie. A4)".colorize(:yellow)
        aim = gets.chomp.split(//,2)
        row = aim[0].capitalize
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
        if row.class == Integer && col.class == Integer
            if @game_board[row][col] == "~"
                @game_board[row][col] = "O"
                puts "Missed!".colorize(:yellow)
            elsif @game_board[row][col] == "S"
                @game_board[row][col] = "X"
                puts "Direct Hit Captain!".colorize(:yellow)
                @game_end_counter -= 1
            elsif @game_board[row][col] == "X" || @game_board[row][col] == "O"
                puts "You've already aimed here Captain".colorize(:yellow)
            else 
                puts "Missed!".colorize(:yellow)
            end
        else 
            puts "You misfired Captain".colorize(:yellow)
        end 
        sleep 1
    end 
end 

class Player 
    attr_reader :name

    def initialize(name)
        @name = name 
        puts "Welcome to battle, Captain #{self.name}".colorize(:yellow)
    end 
end 

puts font.write("BATTLE SHIPS").colorize(:red)
play_again = false
decision = false 
until play_again 
    until decision 
        puts "What would you like to do:".colorize(:yellow)
        puts "[1] - Play".colorize(:yellow)
        puts "[2] - Quit".colorize(:yellow)
        selection = gets.chomp.to_i  
        if selection == 1 || selection == 2
            decision = true
        end 
    end 

    case selection 
        when 1
            puts "Enter Player 1 name:".colorize(:yellow)
            input1 = gets.chomp
            first_player = Player.new(input1)
            sleep 2
            puts "Captain #{first_player.name}, your ships are about to launch...".colorize(:yellow)
            sleep 1
            bar = TTY::ProgressBar.new("Launching Ships [:bar]".colorize(:yellow), total: 30)
                30.times do
                sleep(0.1)
                bar.advance(1)
                end
            player1 = Board.new 
            player1.draw_ship(2)
            player1.draw_ship(3)
            player1.draw_ship(3)
            player1.draw_ship(4)
            player1.draw_ship(5)
            player1.draw_board()
            
            puts "Enter Player 2 name:".colorize(:yellow)
            input2 = gets.chomp
            second_player = Player.new(input2)
            sleep 2
            puts "Captain #{second_player.name}, your ships are about to launch...".colorize(:yellow)
            sleep 1
            bar = TTY::ProgressBar.new("Launching Ships [:bar]".colorize(:yellow), total: 30)
                30.times do
                sleep(0.1)
                bar.advance(1)
                end
            player2 = Board.new 
            player2.draw_ship(2)
            player2.draw_ship(3)
            player2.draw_ship(3)
            player2.draw_ship(4)
            player2.draw_ship(5)
            player2.draw_board()

            until player1.game_end_counter == 0 || player2.game_end_counter == 0
                shot_fired = false
                until shot_fired 
                    puts "Captain #{first_player.name}, what are your orders?".colorize(:yellow)
                    puts "[1] - View status of our ships".colorize(:yellow)
                    puts "[2] - View previous attacks".colorize(:yellow)
                    puts "[3] - Launch attack on the enemy".colorize(:yellow)
                    orders = gets.chomp.to_i
                        if orders == 1
                            player1.draw_board()
                        elsif orders == 2
                            player2.draw_board_hidden()
                        elsif orders == 3
                            player2.shoot()
                            player2.draw_board_hidden()
                            shot_fired = true
                        else 
                        end   
                end 

                if player1.game_end_counter == 0 || player2.game_end_counter == 0
                    break
                end 

                shot_fired = false
                until shot_fired 
                    puts "Captain #{second_player.name}, what are your orders?".colorize(:yellow)
                    puts "[1] - View status of our ships".colorize(:yellow)
                    puts "[2] - View previous attacks".colorize(:yellow)
                    puts "[3] - Launch attack on the enemy".colorize(:yellow)
                    orders = gets.chomp.to_i
                        if orders == 1
                            player2.draw_board()
                        elsif orders == 2
                            player1.draw_board_hidden()
                        elsif orders == 3
                            player1.shoot()
                            player1.draw_board_hidden()
                            shot_fired = true
                        else 
                        end   
                end 
                if player1.game_end_counter == 0 || player2.game_end_counter == 0
                    break
                end 
            end 
            if player1.game_end_counter == 0 
                puts "Congratulations Captain #{first_player.name}!".colorize(:yellow)
                puts "You've defeated your enemy, #{second_player.name}!".colorize(:yellow)
            else 
                puts "Congratulations Captain #{second_player.name}!".colorize(:yellow)
                puts "You've defeated your enemy, #{first_player.name}!".colorize(:yellow)
            end 
        when 2
            puts "Okay, Goodbye".colorize(:yellow)
        else 
        end 
    puts "What would you like to do:".colorize(:yellow)
    puts "[1] - Play Again?".colorize(:yellow)
    puts "[2] - Quit".colorize(:yellow)
    again = gets.chomp.to_i
    if again == 1
        play_again = false
    else 
        puts "Okay, Goodbye".colorize(:yellow)
        play_again = true
    end  
end 
