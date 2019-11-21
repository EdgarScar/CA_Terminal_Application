require "tty-progressbar"
require "colorize"
require "tty-font"
font = TTY::Font.new(:doom)

# Constant variables are defined to ensure ships are not played beyond the game board grip.
MIN_ROW = 1
MIN_COL = 1
MAX_ROW_HORIZ = 10
MAX_COL_VERT = 10 
VERTICAL_ORIENTATION = 1
HORIZONTAL_ORIENTATION = 2

# Ship class is created to establish coordinates for a new ship to be placed on the game board grid.
class Ship 
attr_reader :coordinates

    def initialize(size)
        @size = size
        @orientation = rand(VERTICAL_ORIENTATION..HORIZONTAL_ORIENTATION)
        self.set_coordinates()
    end
# A class method is used, along with the constant variables, to establish a ship's coordinates. 
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

# Board class is necessary as all a player's ships, hits and misses will be represented on a different instance. 
class Board
attr_reader :game_end_counter

# An array of arrays is used to create the game board grid to make iteration easier.
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
# This variable is used to count down every time a ship is hit. When a player has no count left, the game ends. 
    @game_end_counter = 17
    end 

# A class method is used to draw the inital game board grid with the player's ship locations 
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

# A class method is used to draw the game board grid of the opponent. This ships are hidden, while
# the hits and misses are displayed. 
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
    
# A class method is used to plot plot a ship onto the player's game board grid. 
    def draw_ship(ship_size)
        placed_ship = false
# An until loop uses a boolean that will check if ship is clashing with another ship.
        until placed_ship 
            ship = Ship.new(ship_size)
            ship_clash = false
            ship.coordinates.each do |coor|
                if @game_board[coor[0]][coor[1]] == "S"
                    ship_clash = true
                end
            end
# If a ship clash does not occur, the ship will be printed to the game board grid. 
            if !ship_clash
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

# A class method is used to prompt the user to input coordinates to aim their attack. 
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
# The coordinates are then plotted onto the game board as either a hit or a miss. 
        if row.class == Integer && col.class == Integer
            if @game_board[row][col] == "~"
                @game_board[row][col] = "O"
                puts "Missed!".colorize(:light_green)
            elsif @game_board[row][col] == "S"
                @game_board[row][col] = "X"
                puts "Direct Hit Captain!".colorize(:red)
                @game_end_counter -= 1
            elsif @game_board[row][col] == "X" || @game_board[row][col] == "O"
                puts "You've already aimed here Captain.".colorize(:yellow)
            else 
                puts "Missed!".colorize(:light_green)
            end
        else 
            puts "Incorrect coordinates - Misfire!".colorize(:light_green)
        end 
        sleep 1
    end 
end 

# A player class is used to facilitate the Character Name feature.
class Player 
    attr_reader :name

    def initialize(name)
        @name = name 
        puts "Welcome to battle, Captain #{self.name}.".colorize(:yellow)
    end 
end 

# The game application runs from the code below. 
puts font.write("BATTLE SHIPS").colorize(:red)
play_again = false
decision = false 
# An until loop is used to play multiple games. 
until play_again 
# An until loop is used to ensure a valid selection is made. 
    until decision 
        puts "What would you like to do:".colorize(:yellow)
        puts "[1] - Play".colorize(:yellow)
        puts "[2] - Quit".colorize(:yellow)
        selection = gets.chomp.to_i  
        if selection == 1 || selection == 2
            decision = true
        end 
    end 
# A case/when statement is used to run the body of the game code. 
    case selection 
        when 1
# The first player is created and a name is input. 
            puts "Enter Player 1 name:".colorize(:yellow)
            input1 = gets.chomp
            first_player = Player.new(input1)
            sleep 2
            puts "Captain #{first_player.name}, your ships are about to launch...".colorize(:yellow)
            sleep 2
            bar = TTY::ProgressBar.new("Launching Ships [:bar]".colorize(:blue), total: 30)
                30.times do
                sleep(0.1)
                bar.advance(1)
                end
# A new instance of the game board class is created for player one. 
            player1 = Board.new 
# Player one's ships are generated and plotted on the game board grip. 
            player1.draw_ship(2)
            player1.draw_ship(3)
            player1.draw_ship(3)
            player1.draw_ship(4)
            player1.draw_ship(5)
            player1.draw_board()

# The first player is created and a name is input. 
            puts "Enter Player 2 name:".colorize(:yellow)
            input2 = gets.chomp
            second_player = Player.new(input2)
            sleep 2
            puts "Captain #{second_player.name}, your ships are about to launch...".colorize(:yellow)
            sleep 2
            bar = TTY::ProgressBar.new("Launching Ships [:bar]".colorize(:blue), total: 30)
                30.times do
                sleep(0.1)
                bar.advance(1)
                end
# A new instance of the game board class is created for player two. 
            player2 = Board.new 
# Player two's ships are generated and plotted on the game board grip. 
            player2.draw_ship(2)
            player2.draw_ship(3)
            player2.draw_ship(3)
            player2.draw_ship(4)
            player2.draw_ship(5)
            player2.draw_board()

# An until loop is used to break the code when either player wins the game. 
            until player1.game_end_counter == 0 || player2.game_end_counter == 0
                shot_fired = false
# An until loop is used to only progress to the next player when an attack is launched. 
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
# An if statment is used to end the game at this point if player one has won the game. 
                if player1.game_end_counter == 0 || player2.game_end_counter == 0
                    break
                end 
# An until loop is used to only progress to the next player when an attack is launched. 
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
# An if statment is used to end the game at this point if player two has won the game.
                if player1.game_end_counter == 0 || player2.game_end_counter == 0
                    break
                end 
            end 
# An if statement is used to tell the winner they have won the game. 
            if player1.game_end_counter == 0 
                puts "Congratulations Captain #{first_player.name}!".colorize(:yellow)
                puts "You've defeated your enemy, #{second_player.name}!".colorize(:yellow)
            else 
                puts "Congratulations Captain #{second_player.name}!".colorize(:yellow)
                puts "You've defeated your enemy, #{first_player.name}!".colorize(:yellow)
            end 
        when 2
            puts "Okay, Goodbye".colorize(:yellow)
            exit 
        else 
        end 
# Once a game has ended, the users have a choice to play again or quit. 
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
