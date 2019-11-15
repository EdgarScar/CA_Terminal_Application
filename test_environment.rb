def create_ship_3
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

        print vert_coors

    else 
        hor_num_x = rand(1..9)
        hor_x_coors = []
        hor_x_coors.push(hor_num_x - 1)
        hor_x_coors.push(hor_num_x)
        hor_x_coors.push(hor_num_x +1)

        hor_coors = {}
        hor_coors[keys[rand(1..10)]] = hor_x_coors

        print hor_coors
    end 
end 

create_ship_3

