game_board = [
    ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
    ["A", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    ["B", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
    ["C", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    ["D", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    ["E", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
    ["F", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    ["G, ""~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    ["H", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    ["I", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    ["J", "~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
    ]

def draw_board(board)      
    board.each do |array|
        print "\n"
        print arrat 
        # array.each do |column| 
        #     print column
        # end 
        print "\n"
    end 
end  

# class Board_Comp < Board

#     def initialize
#     end 
    
#     def draw_board
#         super 
#     end 

def ship_coors
    keys = ["0", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    vert_or_hor = rand(1..2)
    if vert_or_hor == 1
        vert_y_coors = []
        vert_num_y = rand(2..9)
        vert_y_coors.push(keys[vert_num_y - 1])
        vert_y_coors.push(keys[vert_num_y])
        vert_y_coors.push(keys[vert_num_y + 1])
        
        vert_num_x = rand(0..9)

        vert_coors = {}
        vert_coors[vert_y_coors[0]] = vert_num_x
        vert_coors[vert_y_coors[1]] = vert_num_x
        vert_coors[vert_y_coors[2]] = vert_num_x

        return vert_coors

    else 
        hor_num_x = rand(1..9)
        hor_x_coors = []
        hor_x_coors.push(hor_num_x - 1)
        hor_x_coors.push(hor_num_x)
        hor_x_coors.push(hor_num_x +1)

        hor_coors = {}
        hor_coors[keys[rand(1..10)]] = hor_x_coors

        return hor_coors
    end 
end

def ship_launch(coors)





# class Board_User < Board

def shoot()
    coordinate = gets.chomp.split(//,2)
    letter = coordinate[0]
    number = coordinate[1].to_i - 1
    return letter, number
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
        draw_board(game_board)
        puts "Launching your ship..."
        sleep 2
        coors = ship_coors()


        puts "Enter coordinates to attack: (ie. 'A4')"
        letter, number = shoot()
        game_board[letter][number] = "X"
        draw_board(game_board)
        print "\n"
    when 2
        puts "Goodbye"
    else 
        puts "No valid"
end 
