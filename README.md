## Implementation Plan

### Feature - Character Name Creation 

#### Implementation:  

>To implement this feature, a ‘Player’ class will be created. The initialize will ‘puts’ a message prompting the user to enter a character name. The user input will be chomped and assigned as the value to an instance variable called name. 
>
>A ‘puts’ will be displayed welcoming the new player to the game. 
>
>The instance variable name will be given attribute reader rights. 

#### Checklist:

- Create ‘Player’ class 
- Define Initialize method 
- Include ‘puts’ prompt to chomp input
- Give instance variable name attribute reader rights 
- Create new Player class instance for each user in in-game menu 

### Feature - Generate Ship Coordinates 

#### Implementation:  

>The ships will first be created using a ‘Ship’ class. The initialize method will take in one argument, an integer, as the length of the ship. The length will be stored in an instance variable of the same name. Whether the ship will be placed vertically or horizontally will be determined by a random number between 1 and 2. This value will be stored in an instance variable called ‘orientation’. 
>
>Constant variables will be created to store values for the extremities of the game board grid on which the ships can be placed. 
>
>A class method will be created to determine the random coordinates on which the ship will be drawn on the game board grid. 
>
>The method will contain an if/else statement. If the orientation of the ship is to be vertical, the row coordinate will be a random number between the minimum available row (1) and the maximum available row, which will be the last row (10) minus the length of the ship minus 1. This is to ensure the vertical ship does not protrude below the game board grid. The column coordinate will be a random number between the minimum available column (1) and the maximum available column for a vertical ship (10). These two numbers will be the starting coordinates for a vertical ship. 
>
>If the orientation of the ship is to be horizontal, the row coordinate will be a random number number between the minimum available row (1) and the maximum available row for a horizontal (10). The column coordinate will be a random number between the minimum available column (1) and the maximum available column, which will be the last column (10) minus the length of the ship minus 1. This is to ensure the horizontal ship does not protrude out the right side of the game board grid. There two numbers will be the starting coordinates for a horizontal ship. 
>
>An array will be created to store the total coordinates of a ship. The determined starting coordinates will be pushed into this array as another array. Another if/else statement will be used to create the additional coordinates for the remainder of the ship. 
>
>If the orientation is vertical, the column coordinate will remain the same. The row coordinate will be increased by 1, and the two coordinates will be pushed as an array into the total coordinates array. This will be repeated in a ‘for’ loop as many times as is the length of the ship, minus 1. This is because the starting coordinates will already have been pushed into the total coordinates array. 
>
>If the orientation is horizontal, the row coordinate will remain the same, the column coordinate will be increased by 1, and the two coordinates will be pushed as an array into the total coordinates array. Again, this will be repeated in a ‘for’ loop as many times as is the length of the ship, minus 1. 

#### Checklist: 

- Create ‘Ship’ class
- Define Initialize method with one argument and two instance variables
- Define constant variables 
- Define class method to generate coordinates 
- Include attribute reader for total coordinates array
- Have initialize method call class method that creates the coordinates 

### Feature - Draw Game Board Grids (with Ship Locations)

#### Implementation: 
>To draw the game board grid, a Board class will be created. 

>*The initialize method will have one instance variable called game board which contain a hash. The first key of the hash will be “0” with the value being an array, with strings in each index being the numbers “1” to “10”. There will be ten additional keys, each being a string with a letter from “A” to “J”. The values for each of these will be an array, with each index being a string containing a “~” (tilde). 
*This approach was changed as per the status update of 14/11/2019 

>The initialize method will have an instance variable called game board which will contain an array of arrays. The first array within the array will be strings from “0” to “10”. An additional ten arrays within the game board array will be created. The [0] index in each of these arrays will be a string with a letter from “A” to “J”. The subsequent indexes, ranging from [1] to [11], will each contain a string with a “~” (tilde). A second instance variable will be created and assigned an integer. This will act as a countdown mechanism to end the game when either player wins. 
>
>A class method will be defined that will plot a ship on the game board, as long as no other ship is already occupying any of the proposed coordinates. This method will take one argument, an integer, that is to be the length of the ship. In order to obtain the coordinates for a proposed ship, the method will create a variable and assign as its value a new instance of the Ship class. An ‘each’ loop will then iterate over the indexes in the game board array to determine whether the coordinates of the proposed ship will clash with an already existing ship. Using an ‘until’ loop, this method will continue to create a new instance of the Ship class until one is created that has coordinates that do not clash with an existing ship on the game board array. Once this occurs, the ‘until’ loop will be broken using a boolean. The method will then change the relevant indexes, that correspond with the new ship’s coordinates, within the game board array to represent the new ship. 
>
>A class method will be defined that iterates over each array in the game board instance variable and prints the array to the screen. This will draw the game board to the screen and display the locations on any ships that have been assigned to that Board class instance. 

#### Checklist: 
- Create a Board class
- Define initialize method with one instance variable of a hash containing the game board 
- Define initialize method with an instance variable as an array of arrays to create the game board
- Include additional instance variable for countdown mechanism 
- Define class method that will draw ships onto the game board array
- Create ‘until’ loop using a boolean to check whether ship has been placed successfully 
- Create ‘each’ loop to iterate over indexes in game board array to check availability for new ship 
- Define class method that will print the game board arrays to the screen using an ‘each’ loop 

### Feature - Draw Game Board Grid (w/out Ships, w/ Hits and Misses)

#### Implementation: 
>A class method will be defined within the Board class that iterates over each array in the game board instance variable. An if/else statement will check whether an index contains a ship’s coordinate. If it does, it will print a “~” instead of the “S”. This will hide the opponent’s ships from the current player’s view. If an index of an array within the game board instance variable has been changed to represent a hit (“X”) or a miss (“O”), this will not be changed so the User can see what the outcome of their previous attacks have been.  
>
>The method will print each array in the game board instance variable, including all changed and non changed index values. 
Define class method that will iterate over each array in the game board 

#### Checklist: 
- Create if/else statement to check whether coordinate is occupied by a ship 
- Have if/else statement alter index value if occupied by a ship
- Have if/else statement maintain index value if not occupied by a ship
- Have if/else statement print all changed and not changed index values 

### Feature - Attack Opponent’s Coordinates 

#### Implementation: 
> A class method will be defined in the Board class. In the class method, a ‘puts’ message will prompt the current user to input the coordinates on which they would like to attack. This will be a combination of a letter and a number. The user input will be chomped and split into two strings, with each string being assigned as a value to a respective variable - row and column. 
>
>The column string will be converted into an integer. 
>
>An if/else statement will be created in order to convert the value of row into its corresponding numerical equivalent. This is so the value can be used as an integer in order to reference a particular row within the game board array. 
>
>Another if/else statement will then check the coordinates against the current index value within the game board array. Else, if the index of the selected coordinates is not a ship, it will be changed to an “O” to represent a miss. If it is a ship, it will be changed into an “X” to represent a hit. 
>
>If a ship was successfully hit, the instance variable in the initialize method used as a countdown mechanism will be decreased by 1. 

#### Checklist: 
- Define class method that will ‘puts’ a prompt for the user’s coordinate selection 
- Chomp the user selection and split into two strings in an array
- Convert the column value to an integer
- Create an if/else statement to convert the row value from a string containing a letter to its corresponding integer
- Create if/else statement that changes the game board index to the relevant outcome  
- Decrease the countdown mechanism by 1 if ship successfully hit 
