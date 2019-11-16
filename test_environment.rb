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

    def draw_ship(ship)
        ship.coordinates.each do |coor|
            row = coor[0]
            col = coor[1]
            @game_board[row][col] = "S"
        end 
    end 

    def shoot()
        puts "Name your coordinates (row, column) to shoot (ie. 36 or 82)"
        coordinate = gets.chomp.split(//,2)
        row = coordinate[0]
        col = coordinate[1]
        return row, col
    end 


end 

ship1 = Ship.new()
ship1.get_start_coordinates()
ship1.get_coordinates()

player1 = Board.new 

player1.draw_ship(ship1)

player1.draw_board()

