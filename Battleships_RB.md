# Battle Ships RB 

## Software Development Plan 


## Status Update - 16/11/2019

The original approach to draw the board was using a hash, with the keys being the row labels and the values being arrays. This approach has proved to be difficult because iterating over a hash and then the array as the value was beginning to become complex. Instead, I have decided to rejig the board matrix and use arrays within arrays. I believe this will allow me to write much simpler code to iterate over each index for the majority of the methods needed within the application. I will also create a ship class that has instance variables of size, starting coordinates and orientation. 