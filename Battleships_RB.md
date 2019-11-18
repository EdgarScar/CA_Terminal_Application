# Battle Ships RB 

## Software Development Plan 

Battle Ships RB will be a terminal application game similar to the classic board game Battleships. The
game involves two players, each having their own grid like playing board with the numbers one to
ten running along the x-axis, and the letters A to J along the y-axis. Both players have a certain
number of ships that are plotted onto their own respective playing grid. While each player knows
the location of their own ships, the location of their opponent’s ships are a mystery. The players
then take it in turn to try and guess the location of the other player’s ships using coordinates to
strike an attack. The first player that successfully locates all of the other player’s ships wins.

The purpose of Battle Ships RB is to take a classic, widely known and enjoyed board game and
digitally revamp to make it more accessible to a wider demographic of people. The board game
version involves physical playing pieces that requires the players to set up, manually move each turn
and store securely after playing. If any of the ships, location indicator pins or board pieces are lost
the game is rendered unplayable. Additionally, the physical game may not be suitable for younger
children as the small pieces could potentially be a choking hazard. These problems are solved by
creating a digital version that can be enjoyed easily and safely by people of all ages. A digital version
can be played an infinite amount of times without the risk of losing game pieces, the game physical
deteriorating or safety concerns involving young children.

As an application that will be created primarily for entertainment, Battle Ships RB is designed to
appeal to a broad target audience, being both genders, from the ages of 5 and up. The game rules
and presentation will be designed in a simple, easy to understand way so that the game can be
accessible to people with varying degrees of technological ability. Similarly, the use of bright colours,
non-offensive graphics and engaging game play will make it appealing to both younger and older
generations alike.

## Status Update - 16/11/2019

The original approach to draw the board was using a hash, with the keys being the row labels and the values being arrays. This approach has proved to be difficult because iterating over a hash and then the array as the value was beginning to become complex. Instead, I have decided to rejig the board matrix and use arrays within arrays. I believe this will allow me to write much simpler code to iterate over each index for the majority of the methods needed within the application. I will also create a ship class that has instance variables of size, starting coordinates and orientation. 