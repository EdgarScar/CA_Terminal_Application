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
        coordinates = []
        row = @start_coor[0]
        col = @start_coor[1]
        if @orientation == 1
            coor_second = [row + 1, col]
            coor_third = [row + 2, col]
            coordinates.push(@start_coor)
            coordinates.push(coor_second)
            coordinates.push(coor_third)
        elsif @orientation == 2
            coor_second = [row, col + 1]
            coor_third = [row, col + 2]
            coordinates.push(@start_coor)
            coordinates.push(coor_second)
            coordinates.push(coor_third)
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

    def draw_ship()
    end 

    def shoot()
        puts "Name your coordinates (row, column) to shoot (ie. 36 or 82)"
        coordinate = gets.chomp.split(//,2)
        row = coordinate[0]
        col = coordinate[1]
        return row, col
    end 


end 

# draw_board(game_board)

ship1 = Ship.new()
ship1.get_start_coordinates()
ship1.get_coordinates()

player1 = Board.new 

player1.draw_board()

#     puts "Enter coordinates for beginning of ship: (ie. 'A4')"
#     user_ship_three_beg = gets.chomp.split(//,2)
#     letter = user_ship_three_beg[0]
#     number = user_ship_three_beg[1].to_i - 1

#     puts "letter: #{letter} number: #{number}"

#     game_board[letter][number] = "X"

# draw_board(game_board)
# MIN_ROW_FOR_SHIP=1
# MAX_ROW_FOR_SHIP=10

# def ship_coors
#     keys = ["0", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
#     vert_or_hor = rand(1..2)
#     if vert_or_hor == 1

#         vert_y_coors = []
#         vert_start_row = rand(MIN_ROW_FOR_VERTICAL_SHIP+1..MAX_ROW_FOR_VERTICAL_SHIP-1)
#         vert_y_coors.push(keys[vert_start_row - 1])
#         vert_y_coors.push(keys[vert_start_row])
#         vert_y_coors.push(keys[vert_start_row + 1])
        
#         vert_num_x = rand(0..9)

#         coors = {}
#         coors[vert_y_coors[0]] = vert_num_x
#         coors[vert_y_coors[1]] = vert_num_x
#         coors[vert_y_coors[2]] = vert_num_x

#         return coors

#     else 
#         hor_num_x = rand(1..9)
#         hor_x_coors = []
#         hor_x_coors.push(hor_num_x - 1)
#         hor_x_coors.push(hor_num_x)
#         hor_x_coors.push(hor_num_x +1)

#         coors = {}
#         coors[keys[rand(MIN_ROW_FOR_VERTICAL_SHIP..MAX_ROW_FOR_VERTICAL_SHIP)]] = hor_x_coors

#         return coors
#     end 
# end

# def ship_launch(coors)
#     coors.each do |key, value|
#         if coors[key].class == Array
#             letter = key
#             number_0 = coors[key][0]
#             number_1 = coors[key][1]
#             number_2 = coors[key][2]
#             return letter, number_0, number_1, number_2
#         else 
#             array_1 = []
#             for i in coors do
#                 array_1.push(key)
#             end
#             print array_1
#         end
#     end
# end 

# coors = ship_coors()
# ship_launch(coors)
