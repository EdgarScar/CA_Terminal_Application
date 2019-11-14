# # Create Gameboard 

# class Board_Creation

#     def initialize(rows, columns)
#         @rows = rows 
#         @columns = columns
#     end 

#     def draw_board_easy
#         (@columns).times do 
#             row_1.push("~")
#             row_2.push("~")
#             row_3.push("~")
#             row_4.push("~")
#             row_5.push("~")
#         end 
#         puts "#{row_1[0]} #{row_1[1]} #{row_1[2]} #{row_1[3]} #{row_1[4]}"
#         puts "#{row_2[0]} #{row_2[1]} #{row_2[2]} #{row_2[3]} #{row_2[4]}"
#         puts "#{row_3[0]} #{row_3[1]} #{row_3[2]} #{row_3[3]} #{row_3[4]}"
#         puts "#{row_4[0]} #{row_4[1]} #{row_4[2]} #{row_4[3]} #{row_4[4]}"
#         puts "#{row_5[0]} #{row_5[1]} #{row_5[2]} #{row_5[3]} #{row_5[4]}"
#     end 

#     def draw_board_hard
#         row_1 = []
#         row_2 = []
#         row_3 = []
#         row_4 = []
#         row_5 = []
#         row_6 = []
#         row_7 = []
#         row_8 = []
#         row_9 = []
#         row_10 = []
#         (@columns).times do 
#             row_1.push("~")
#             row_2.push("~")
#             row_3.push("~")
#             row_4.push("~")
#             row_5.push("~")
#             row_6.push("~")
#             row_7.push("~")
#             row_8.push("~")
#             row_9.push("~")
#             row_10.push("~")
#         end 
#         row_1.each do |value| 
#         counter = 1
#             if row_1[counter] != nil 
#                 print "#{row_1[counter]} "
#                 counter += 1
#             end 
#         end 



        # puts "#{row_1[0]} #{row_1[1]} #{row_1[2]} #{row_1[3]} #{row_1[4]}"
        # puts "#{row_2[0]} #{row_2[1]} #{row_2[2]} #{row_2[3]} #{row_2[4]}"
        # puts "#{row_3[0]} #{row_3[1]} #{row_3[2]} #{row_3[3]} #{row_3[4]}"
        # puts "#{row_4[0]} #{row_4[1]} #{row_4[2]} #{row_4[3]} #{row_4[4]}"
        # puts "#{row_5[0]} #{row_5[1]} #{row_5[2]} #{row_5[3]} #{row_5[4]}"
        # puts "#{row_6[0]} #{row_6[1]} #{row_6[2]} #{row_6[3]} #{row_6[4]}"
        # puts "#{row_7[0]} #{row_7[1]} #{row_7[2]} #{row_7[3]} #{row_7[4]}"
        # puts "#{row_8[0]} #{row_8[1]} #{row_8[2]} #{row_8[3]} #{row_8[4]}"
        # puts "#{row_9[0]} #{row_9[1]} #{row_9[2]} #{row_9[3]} #{row_9[4]}"
        # puts "#{row_10[0]} #{row_10[1]} #{row_10[2]} #{row_10[3]} #{row_10[4]}"
#     end 
# end 

# board1 = Board_Creation.new(10, 10)


maze2 = {
    " 0 " => [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 ", " 10 "],
    " A " => [" ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ "], 
    " B " => [" ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ "],
    " C " => [" ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ "],
    " D " => [" ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ "],
    " E " => [" ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ ", " ~ "],
}

maze2.each do |label, array|
    print "\n"
    print label 
    array.each do |column| 
        print column
    end 
    print "\n"
end 