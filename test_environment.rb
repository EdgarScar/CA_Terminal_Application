game_board = {
    "0" => ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
    "A" => ["~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    "B" => ["~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
    "C" => ["~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    "D" => ["~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    "E" => ["~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
    "F" => ["~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    "G" => ["~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    "H" => ["~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    "I" => ["~", "~", "~", "~", "~", "~", "~", "~", "~", "~"], 
    "J" => ["~", "~", "~", "~", "~", "~", "~", "~", "~", "~"],
    }
    def draw_board(board)
                
        board.each do |label, array|
            print "\n"
            print label 
            array.each do |column| 
                print column
            end 
            print "\n"
        end 
    end   

draw_board(game_board)

    puts "Enter coordinates for beginning of ship: (ie. 'A4')"
    user_ship_three_beg = gets.chomp.split(//,2)
    letter = user_ship_three_beg[0]
    number = user_ship_three_beg[1].to_i - 1

    puts "letter: #{letter} number: #{number}"

    game_board[letter][number] = "X"

draw_board(game_board)



