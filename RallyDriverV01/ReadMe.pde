/*
Name : Margaret McCarthy
Student Number:  20095610

Brief description of the game developed:  This is a car game where the aim of the game is to earn a high score by passing out as many cars as possible without crashing.  
You are the red car at the bottom of the screen and you can move left and right by pressing the left and right arrows.  You determine the difficulty of the game when you 
start the program which sets how many cars you will have to avoid.  The more difficult the game the more cars you will have to avoid.  You also determine the number of 
games you want to play and you have 3 lives per game.  If you lose your 3 lives the game will ask you do you want to continue.  When you have played all your games your 
score will be displayed for each game with your highest score, the lowest score and the average score.  You do earn a bonus of 5points every time you earn 20 points which bumps 
up your score.    

Known bugs/problems:
1. The gap in the array of tracklines.  This was the closest I could get to getting them to continuously display on the screen but ideally they would be continuous and move faster.
2. Collision detection is not down to the pixel and could be more accurate.  I just used the bonnets of the cars as this was accurate enough for the design.  
3. If you enter less than 3 games in the dialog box it causes an error so just go with 3 games or more.  
4. I couldn't get the Car overloaded constructor to take in the 3 colour parameters and use them properly.  The display mehthod overrode the colour.  I just ran out of time to fix 
   all these bugs in the end so left it but I am aware of it not working properly.  
5. Sometimes when a new game is started the driver is already moving.  I tried to fix this so the xDirection was set to 0 when the game was reset but it didnt' work.
6.  The time elapsed which is displayed in seconds on the top right of the screen starts from when you start the program and not from when the race is started.

Any sources referred to during the development of the assignment (be precise and specific with references) {there no need to reference lecture/lab materials}:

* https://www.youtube.com/playlist?list=PLRqwX-V7Uu6ZiZxtDDRCi6uhfTH4FilpH
  Looked at lots of his videos but mainly the Space Invaders one for key handling and handling the array of cars 

* https://processing.org/ 
  Looked up use of modulo / millis() / JOption showQuestion _Message / Soundfile / PFont and lots of other methods that were allowed in constraints but I never used in the end.  
* http://www.jeffreythompson.org/collision-detection/ 
  After refactoring the PONG collision detection and being mildly happy with the results I found this guy who I thought clarified it well and it worked much better for me.  
* http://freesound.org
  Used this for my sound files, soundtrack, boom and woohoo
 
*/
