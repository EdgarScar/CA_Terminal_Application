
ship1 = Ship.new()
ship1.get_start_coordinates()
ship1.get_coordinates()

player1 = Board.new 

player1.draw_ship(ship1)

player1.draw_board()

player1.shoot()
player1.draw_board()
