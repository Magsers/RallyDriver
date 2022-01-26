/* Reflection

Name : Margaret McCarthy  

Student Number:  20095610

Link to Video on YouTube:                e.g. https://youtu.be/lUdbvEPQwng


Part A - Mark (11 /11)
-----------------------------

Includsion of completed:
- Readme             (1)
- Reflection         (5)
- Video              (5)

Part B - Mark (4 /4)
-----------------------------

Comments, 
- Consistent indentation throughout the code
- Relevant naming throughout project
- Code structure is neat, well ordered and legible

Part C - Mark (5/5)
-----------------------------
Use of if and loop statements:

IF STATEMENTS
Line 102 Driver class - If statment to keep the driver within the boundaries of the road
Line 248 RallyDriverV01 If isBonusFlashing - If statement using millis() to flash a bonus on screen! 

FOR LOOPS
Line 120 RallyDriverV01 to display a moving array of tracklines
Line 167 RallyDriverV01 collisionDetection() method uses a for loop to check for a collision with each car in the array and the driver.

WHILE LOOPS
Line 76-79 RallyDriverV01 in setup() while loop to set up an array of tracklines
Line 90-93 RallyDriverV01 in setup() while loop to set up an array of cars

DO WHILE LOOPS
Line 129-137 RallyDriverV01 to display a moving array of cars.
Line 80-86 Player Class do while loop to run through the scores array to return the highest score.

FOR EACH LOOP
Line 109-113 Player Class in averageScore() to run through the array of scores to add them together and divide them by the array length to return the average score

NESTED LOOPS:
Line 166 RallyDriverV01 if statement with for loop nested.  If player still has lives left, for each car in the array check for collision detection with the driver
Line 219 RallyDriverV01 if isBooming is true and if the time now (millis()) is less than the time of the collision plus a one second delay...display BOOM!

Part D - Mark (10 /10)
-----------------------------
Working Game with inclusion of bespoke methods in the main sketch.

Bespoke Methods

Line 153 RallyDriverV01 carCrash() returns a true or false value to check if the distance between the x and y coordinates is overlapping.  Returns true if they are and false if not. 
Line 165 RallyDriverV01 collisionDetection() to check for a collision with the bonnet of both the driver and the array of cars bonnets. It handles a set of actions if there are lives left or not.  
Line 211 RallyDriverV01 boom() changes the boolean variable isBooming to true and records the time of the collision and puts it in a variable timeOfCollision
Line 217 RallyDriverV01 boomDisplay() to display the boom for one second
Line 234 RallyDriverV01 bonusWooHoo() Method to set the boolean value of isBonusFlashing to true which is used in another method of the same name so it will stay on the screen for 1 second.  Also increments
the score, the bonus count and plays a sound effect
Line 247 RallyDriverV01 bonusWooHoo(String) Method using millis() to flash a bonus on screen!  
Line 125 Car class disappear() to reset the car coordinates to the top of the screen to ensure the car disappears and doesn't drive through the driver.  

-----------------------------
Part E USER DEFINED CLASSES
-----------------------------

Part E1 - Mark (7 /10)
-----------------------------
User-defined class with appropriate fields, constructors, getters, setters

Car Class : 
Fields - xCoord, yCoord, widthBonnet, heightBonnet, speedX, speedY, Colour fields (red, green, blue)
Getters : getXCoord, getYCoord, getWidthBonnet, getHeightBonnet.
Setters : setXCoord, setYCoord, setWidthBonnet, setHeightBonnet
          Line 134 RallyDriverV01 setColour used to modify the colour of the cars in the array
Constructor Methods : Car class has an overloaded constructor method. One takes two parameters, width and height and the other I just used for index 0 of the car array which 
                      takes five parameters including the colours red, green blue.  I used both constructors but the constructor taking the r,g,b values isn't working the way 
                      I want it to so I ended up calling the setColour method with it in the end.  The colour is being overridden because draw is calling the display method and 
                      there is a fill method in this that is overriding the colour.  I ran out of time to fix this so just included it anyway and used the setColour method instead.  

Driver Class
Fields - xCoord, yCoord, driverWidth, driverHeight, xDirection
Getters : getXCoord, getYCoord, getDriverWidth, getDriverHeight, getXDirection.
Setters : setXCoord, setYCoord, setDriverWidth, setDriverHeight, setXDirection
          Line 199 & 201 RallyDriverV01 driver.setXDirection to set the direction of the driver when a key is pressed.  
Constructor Method : Driver class has two constructor methods, one is the default constructor which takes no parameters and it is not called in this program.
                     The second one takes in parameters, the width and the height of the car and is used in this program.  

TrackLines Class
Fields - xCoord, yCoord, lineWidth, lineHeight, yDirection
Getters : getXCoord, getYCoord, getLineWidth, getLineHeight.
Setters : setXCoord, setYCoord, setLineWidth, setLineHeight
          Line 123-124 RallyDriverV01 if statement to modify the value of the yCoord of the tracklines 
Constructor Methods : TrackLines class just has one constructor method which takes in x and y coordinates and the width and height of the lines.    

Examples of overloaded constructors given but only one constructor used in each class.  

Part E2 - Mark (7 /10)
-----------------------------

Class bespoke methods:

Methods with no return values:
Line 82 Car class display() method that's always being called to display the car.
Line 86 Driver class display() method that's always being called to display the car.
Line 100 Driver class update() method that's always being called to update the cars coordinates
Line 62 TrackLines class display() method to display the white track lines
Line 69 TrackLines class update() method to update the yCoordinate of the white track lines

Methods with returning values:
Line 153 RallyDriverV01 boolean carCrash() Method to determine if there has been a collision.  Returns true if there has and false otherwise.
Line 93 Car class update() method that returns a boolean (scored) which is true if the update method is called.  ie. a car has gone off the screen, a new one needs to be
        updated so the player has scored.  
Line 77 Player class highestScore returns an int value with the highest score of all the games
Line 92 Player class lowestScore returns an int value with the lowest score of all the games
Line 107 Player class averageScore returns an int value with the average score of all the games

Methods with parameters:
Line 59 Car class setColour takes three parameters red, green and blue to give each car a different colour each time the program is run

Overloaded Method 
Line 234 and 247 RallyDriverV01 bonusWooHoo() and bonusWooHoo(String) Two methods that work on displaying the bonus Woo Hoo text and playing the sound effect.  
                One which sets the boolean value needed to ensure it stays on the screen for one second in use with the millis() method and the other method draws the woohoo! 
                
Could have used more methods returning values here.  Aware that the ones used are similar to Pong.  

Part E3 - Mark (6 /10)
-----------------------------

- The user-defined class(es) are used in an appropriate manner 

RallyDriverV01
Line 19 - declare array of cars of class Car
Line 20 - declare a driver object of class Driver
Line 21 - declare an array of tracklines of class TrackLines

getters/setters are used on...
Line 155 - 158 : cars and driver getters for xCoord and yCoord and width and height used for collsion detection
Line 272 - player.getPlayerName used for printing the high scores table.
Line 138 - RallyDriverV01 cars.setColour to set the colour of index 0 in the car array
LIne 199 & 201 RallyDriverV01 setXDirection to set the direction along x axis to left or right
Line 207 RallyDriverV01 setXDirection to 0 when key is released so it stops moving when player releases key

default constructors used on lines...
Line 72 to construct the driver
Line 89-93 to construct an array of cars
Line 75 - 79 to construct an array of trackLines

Overloaded constructors created in car and driver class but only one constructor used in each case.  

Line 68 & 74 Car class : 2 overloaded constructors used, one which takes in two parameters width and height and the other takes in 5 parameters with 3 x colours
Line 67 & 73 Driver class : created 2 constructors one with no parameters (default constructor) and another one which is used in the program which takes in 2 parameters width and height

------------------------
PART F - DATA STRUCTURES
------------------------

Part F1 - Mark (16 /20)
-----------------------------
- Use of a data structure to store information i.e. array

(All line numbers refer to RallyDriver class unless otherwise specified)

selectionValues array
Line 59 selectionValues primitive array declared.  Used for a drop down menu at start of program for user input.

RallyDriverV01 - Cars Array - Object Array
Line 19 Cars Array is declared
Line 59 to 61   Cars array size is defined by the difficulty level the user chooses.  Easy is 3, Medium is 5 and Impossible is 7.  
Lines 83 to 94 Initialised   
Lines 129 to 137 Cars array is displayed and updated.

RallyDriverV01 - Scores Array - Primitive Array
Line 4 in Player Class scores Array is declared
Line 56 Player Class - scores array size is defined by the number of games the user chooses to play.  
Lines 56 in RallyDriver class the player object is created using the player name and the number of games to be played which sets the size of the scores array   
Lines 56 to 63 in Player class adds scores to the array every time a game is over.  


RallyDriverV01 - TrackLines Array - Object Array
Line 21 RallyDriverV01 - TrackLines Array is declared
Line 75 to 80   TrackLines array size is initialised  
Lines 120 to 126 Tracklines array is displayed and updated.

Scores array size specified by user input.  Also scores array values are a result of the score of the game which are added after each game is over.  

Part F2 - Mark (12 /20)
-----------------------------
- Calculations performed on the information stored

Player Class
Line 77 to 89 Highest Score using a do while loop highest score is initialised to the first score achieved and after that all scores are compared to it.  If they are higher they 
              replace the highest score variable with the higher value
Line 92 to 103 Lowest Score using a do while loop lowest score is initialised to the first score achieved and after that all scores are compared to it.  If they are lower they                   
              replace the lowest score variable with the lower value
Line 102 to 109 Average Score using a For each loop each value in the array is added together and divided by the length of the array to give the average score

I didn't come up with any new calculations other than those we used in Pong.  I did refactor the code to use do while loops and a for each loop so I can demonstrate I know
how to use them.  However I am not a gamer so I couldn't really think of what other calculations would be of interest to someone playing this game.  Just giving myself 12
marks here for ticking all the boxes but not including extra calculations.  

...

FINAL CHECK:
I have checked the constraints and I am not breaking any constraints.

*/
