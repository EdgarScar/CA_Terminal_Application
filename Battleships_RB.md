# Battle Ships RB - Software Development Plan 

## Statement of Purpose and Scope 
Battle Ships RB will be a terminal application game similar to the classic board game Battleships. The game involves two players, each having their own grid like playing board. Both players have a certain number of ships that are plotted onto their own respective playing grid. While each player knows the location of their own ships, the location of their opponent’s ships are a mystery. The players then take it in turn to try and guess the location of the other player’s ships using coordinates to strike an attack. The first player that successfully locates all of the other player’s ships wins. 

1. The features of Battle Ships RB will consist of: 
2. User input for personalised character names; 
3. Automatically generated game board grids for each player; 
4. User input to determine the number and size of ships; 
5. Ability for each user to view their own game board grid before they launch an attack; and
6. Attack function based on coordinates input by the users. 

The purpose of Battle Ships RB is to take a classic, widely known and enjoyed board game and digitally revamp to make it more accessible to a wider demographic of people. The board game version involves physical playing pieces that requires the players to set up, manually move each turn and store securely after playing. If any of the ships, location indicator pins or board pieces are lost the game is rendered unplayable. Additionally, the physical game may not be suitable for younger children as the small pieces could potentially be a choking hazard. These problems are solved by creating a digital version that can be enjoyed easily and safely by people of all ages. A digital version can be played an infinite amount of times without the risk of losing game pieces, the game physical deteriorating or safety concerns involving young children. 

As an application that will be created primarily for entertainment, Battle Ships RB is designed to appeal to a broad target audience, being both genders, from the ages of 5 and up. The game rules and presentation will be designed in a simple, easy to understand way so that the game can be accessible to people with varying degrees of technological ability. Similarly, the use of bright colours, non-offensive graphics and engaging game play will make it appealing to both younger and older generations alike. The storyline and language used will also be appropriate for young children. 

## Development of Features 
Upon commencing the application and selecting the option to play a game, each player will be prompted to enter a character name. To achieve this, a Player class will be created. A ‘puts’ will be displayed to the screen and the subsequent user input will be saved to a variable. A new instance of the Player class will then be created with this variable being passed in as an argument. The user’s character name will then be stored in the instance of the Player class as an instance variable. *Error Handling*

After each user has entered their respective character names, the application will generate a game board for each player that is a 10x10 grid with the numbers 1 to 10 running along the x-axis, and the letters A to J down the y-axis. To achieve this, a Board class will be created that includes a class method that will generate a hash. The keys of the hash will be strings containing the letter for each row. Each value will be an array with a tilde symbol as a string occupying each index. The only exception will be the first key value pair (to represent the x-axis), in which the key will be a “0” and the value will be an array with each index being a number from 1-10 as a string. A different instance of the Board class will be created for each player. *Error Handling*

Before the game commences, the users will be able to select how many ships each player will have and the length of each ship. This will be accomplished using a Ship class as well as class methods within the Board class. The Ship class will contain instance variables of the ship’s size and its orientation, either horizontal or vertical. A class method within the Ship class will randomly generate the coordinates on which the ship will be placed on the game board grid, ensuring the ship does not extend beyond the boundaries of the grip and that it is not placed on a coordinate that is already occupied by another ship. For each ship, a new instance of the Ship class will be created. A class method within the Board class will then take in the ship’s instance variables and will change the designated coordinates on the respective player’s game board to an “S” to represent the ship. This process will be contained within a loop that will do as many times as the required number of ships for each user as determined by the user’s input. *Error Handling*

Each player will be shown their own game board with the location of their own ships before the game commences. This will be accomplished by a class method from the Board class that draws the player’s board to the screen with their respective ships. Then, prior to launching each attack, the player whose turn it is will be presented with an option to view their own game board and see the status of their ships. To do this, a “puts” will be displayed to the user asking whether they want to view their game board. An if/else statement will be created that, based on whether the user elects to do so or not, calls the same Board class method that draws the player’s game board that displayed the status of their ships. *Error Handling*

When game commences and as it progresses, each player is prompted to enter coordinates to launch an ‘attack’ on a specific location on their opponent’s game board. The will occur through a “puts” asking the player to enter their coordinates. The input will then be chomped and saved to a variable. This variable will then be passed to a Board class method as an argument. The class method will compare the coordinate to the opponent’s ship locations and then utilise an if/else statement. If the user inputs a coordinate that corresponds to the opponent’s ship, then the method will change the index in the array of the game board to an “X”. Else, if the attack coordinate is not an opponent’s ship, it will change the index to an “O”. If the user has already selected the coordinate a “puts” message will be displayed to the screen telling the user the coordinate has already been selected. *Error Handling* 

## User Interaction and Experience 
When the application is run, the user will be presented with a title screen. A main menu will then be displayed to the screen with a list of options to either begin a game, read the rules, or quit the application. Each option will be displayed next to a specific number that the user is required to input in order to make their selection. The selection input by the user will be chomped and will be made into a case/when statement.

If the user selects to read the rules, a list of the game rules will be displayed to the screen. This screen will explain the concept of the game, instructions on how to play the game and what it takes to win. This screen will also explain to the user what it means to select the number and size of each ship, and how inputting coordinates into the attack feature will result in a hit or miss on the opponent’s game board. After the rules are displayed, the user will only have the option to return to the main menu. 

From the main menu, if the user selects to begin a game, the screen will be cleared and a “puts” will be displayed to the screen prompting to first user to enter a character name. This is how the user will know how to enter their character name. After the first user has entered their name, another “puts” will be displayed to the screen explaining to the user that they are to enter the number of the ships they will have on their own game board. Once an integer is entered, another “puts” will explain to the user that they are to enter a number which will become the length of their first ship. This process of being prompted by a “puts” to enter the length of each ship will continue until the number of ships, as selected by the user, has been met.  

Once the first user’s character name, number of ships and their lengths have been entered, a “puts” will be displayed to the screen explaining to the first user that their own game board grid with the location of their ships will be displayed to the screen. This will also include a warning for the second user not to view the first user’s game board grid. The game board grid will then be displayed for a number of seconds before disappearing again. 

After the first user’s game board is cleared from the screen, the same process for setting up the second user’s features will commence. Like the first user, the second user will be prompted to enter their character name, their number of ships and the length of each ship. A warning to the first user to not view the second user’s game board will then be displayed before the second user is shown their own game board grid with the location of their ships. 
 
- how the user will find out how to interact with / use each feature
- how the user will interact with / use each feature


- how errors will be handled by the application and displayed to the user

## Control Flow Diagram - 
Logic Board 

## Implementation Plan 
Develop an implementation plan which:
- outlines how each feature will be implemented and a checklist of tasks for each feature
- prioritise the implementation of different features, or checklist items within a feature
- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

## Status Updates 
Write TWO status updates on your application. You must write a status update when:
- you significantly change a feature or your implementation plan at any point

- encounter a significant issue, challenge or roadblock
- are halfway through implementing the features
- prior to / after testing the application

    ### Status Update - 16/11/2019

The original approach to draw the board was using a hash, with the keys being the row labels and the values being arrays. This approach has proved to be difficult because iterating over a hash and then the array as the value was beginning to become complex. Instead, I have decided to rejig the board matrix and use arrays within arrays. I believe this will allow me to write much simpler code to iterate over each index for the majority of the methods needed within the application. I will also create a ship class that has instance variables of size, starting coordinates and orientation. 

## Help File* 
Design a help file which includes a set of instructions which accurately describe how to use and install the application.

You must include:
- steps to install the application
- any dependencies required by the application to operate
- any system/hardware requirements
- a written explanation of the different features of the application

## Test Application* 
Design TWO tests which check that the application is running as expected.

Each test should:
- cover a different feature of the application
- state what is being tested
- provide at least TWO test cases and the expected results for each test case

## Developer Options* 
### Git Hub
You must submit a source control repository as a zip file to satisfy this requirement.

### Trello Board Screenshots 
Utilise a project management platform to track the development of the application by:
- having features itemised and broken down into checklists
- setting deadlines, duration or a time-frame for each feature or task
- prioritising tasks

### Script File 
Utilise developer tools to automate the building and testing of the application by:
- writing a script which runs the tests
- writing a script which turns the application into an executable; OR
- packaging the application for use as a module or dependency


