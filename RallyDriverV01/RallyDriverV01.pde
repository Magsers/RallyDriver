/*Student Name : Margaret McCarthy  //<>//
 Student Number : 20095610
 Rally Tournament Description : This is basically a car racing game where you earn points by not crashing.  The aim of the game is to get as high a score as possible.  
 You can move left and right using the arrow keys.  There are no other features for the driver but just make sure you click within the screen when the game starts or 
 otherwise you won't be able to move.  This is a glitch with Processing.  You have 3 lives per game.  You decide how many games you want to play and you decide the difficulty
 level, Easy, Medium or Impossible.  The game keeps track and displays how many lives you have lost and how many games you have played.  Your score per game is also displayed.  
 At the end of the tournament your total score for each game is displayed as well as your highest, lowest and average scores.  
 */

import processing.sound.*;    // Imports from Java Library
import javax.swing.*;

SoundFile soundtrack, wooHooSound, crashSound;
String audioName = "soundtrack.mp3";
String bonusName = "woohoo.mp3";
String crash = "crash.mp3";
String path; 

Car[] cars;                  // Objects required in the game
Driver driver;
TrackLines [] trackLines;
Player player;

int livesLost = 0;            //Variable declaration
int score = 0;
int maxLivesPerGame = 3;
int numberOfGamesPlayed = 0;
int minNumberOfGames = 3;
int delay = 1000;             //number of milliseconds for the Boom! to display
boolean isBooming = false;
boolean isBonusFlashing = false;
int timeOfCollision;
int timeOfBonus;
int border = 200;            //border of race track
float carColor;              //variable which will be initialised to random to give a different color to the cars each time the program is played.
int bonus=0;
String difficultyLevel;
int dlIndex;                  //difficulty level index for the array

void setup()
{
  size(1280, 720);
  
  //loading soundfiles for the soundtrack, the woohoo and the crash
  path = sketchPath(audioName);
  soundtrack = new SoundFile(this, path);
  
  path = sketchPath(bonusName);
  wooHooSound = new SoundFile(this, path);
  
  path = sketchPath(crash);
  crashSound = new SoundFile(this, path);
  
  //User input fields requesting number of games to be played, the user's name and difficulty level desired. 
  minNumberOfGames = Integer.parseInt(JOptionPane.showInputDialog("Welcome to the Rally Tournament\n\n How many games would you like to play: (Min 3) ", "3"));
  player = new Player(JOptionPane.showInputDialog("Enter your name (max 7 chars)", "RedRum"), minNumberOfGames);
  
  //User input to define the length of the cars array which sets the difficulty of the game
  Object [] selectionValues = { "Easy", "Medium", "Difficult" };
  String initialSelection = "Easy";
  Object difficultyLevel = JOptionPane.showInputDialog(null, "Please select your preferred difficulty level?","Select Difficulty", JOptionPane.QUESTION_MESSAGE, null, selectionValues, initialSelection);
  
  //Instructions for the user
  JOptionPane.showMessageDialog(null, "You score points by avoiding the cars.\nEvery 20 cars you avoid you get a bonus of 5.\nMake sure to click in the window to get your car moving and use the left and right arrows to move.\n\nLet the race begin!  ");
  
  //Loading the font for the game
  PFont gameFont = loadFont("SnapITC-Regular-48.vlw");
  textFont(gameFont);
 
  carColor = random(100, 255);            //variable carColor assigned a random value 

  driver = new Driver(80, 40);          //creating a new Driver object
   
  //initialising an array of track line objects
  trackLines = new TrackLines[7];
  int j=0;
  while (j<trackLines.length) {
    trackLines[j] = new TrackLines(width/2, j*height/4, 20, 100);
    j++;
  }
  
  //initialising the array of cars
  if (difficultyLevel == "Easy")
    dlIndex = 3;
  if (difficultyLevel == "Medium")
    dlIndex = 5;
  if (difficultyLevel == "Difficult")
    dlIndex = 7;
  cars = new Car[dlIndex];
  int i=1;
  while (i<cars.length) {
    cars[i] = new Car(80, 40);
    i++;
  }
  cars[0] = new Car(80, 40, 150, 0, 50);    // car object at index 0 in the Car array set to a different colour in order to demonstrate class overloading
  soundtrack.play();
  
}  

//End of setup()

void draw() {

  background(0);
  stroke(255);
  strokeWeight(10);
  line(border, 0, border, height);
  line(width-border, 0, width-border, height);
  fill(255);
  textSize(15);
  text("SCORE : "+score, 25, 30);
  text("LIVES LEFT : "+(maxLivesPerGame-livesLost-1), 25, 60);
  if(numberOfGamesPlayed>0)
    text("High Score : "+player.highestScore(), 25, 90);
  text("GAMES LEFT : "+(minNumberOfGames-numberOfGamesPlayed-1), width-border+20, 30);
  text("Bonus Count; "+bonus, width-border+20, 60);
  text("Time : "+millis()/1000+" secs", width-border+20, 100);

  //display the trackLines
  for (int i=0; i<trackLines.length; i++) {
    trackLines[i].display();
    trackLines[i].update();
    if ((trackLines[i].getYCoord()) == height) {
      trackLines[i].setYCoord(-100);
    }
  }

  //display a moving array of cars
  int i=1;
  do {
    if (cars[i].update()==true) {
      score++;
    }
    cars[i].setColour(0, 255/cars.length*i, carColor);
    cars[i].display();
    i++;
  } while (i<cars.length);          //End of do while loop to display array of cars
  cars[0].setColour(255,0,100); 
  cars[0].display();
  cars[0].update();
  driver.display();
  driver.update();
  collisionDetection();
  boomDisplay();
  bonusWooHoo("Woo Hoo!");
  bonusWooHoo();
}                                              
//END OF DRAW 

//Collision Detection

//Method carCrash() to determine if there has been a collision.  Returns true if there has and false otherwise.
boolean carCrash(Car cars, Driver driver)
{
    if (cars.getXCoord() + cars.getWidthBonnet() >= driver.getXCoord() &&        // cars right edge past driver's left edge
        cars.getXCoord() <= driver.getXCoord() + driver.getDriverWidth() &&      // cars left edge past driver's right
        cars.getYCoord() + cars.getHeightBonnet() >= driver.getYCoord() &&       // cars yCoord edge plus it's height past driver's yCoord
        cars.getYCoord() <= driver.getYCoord() + driver.getDriverHeight()) {     // cars bottom edge past driver's top
        return true;
    }
    return false;
}

//Method collisionDetection() which runs through the array of cars to check if there has been a collision.  after it has checked if there are still lives left in the game.  
public void collisionDetection() {
 if (livesLost < maxLivesPerGame) {         //if player still has lives left
    for (int j=0; j<cars.length; j++) {     //check for collision detection between the driver and array of cars
      boolean collision = carCrash(cars[j], driver);
      if (collision==true) {                //if Collision detection is true, player loses a life
        boom();
        cars[j].disappear();
        crashSound.play();
        livesLost++;
      }
    }                                         //end of for loop collision detection
  } 
  else {                                        //if player still has no lives left in the current game
    numberOfGamesPlayed++;
    player.addScore(score);                     //add the score of the current game to the score array in player
    if (numberOfGamesPlayed < minNumberOfGames) {   //if player has no lives left check if they have games left
      int reply = JOptionPane.showConfirmDialog(null, "Game Over! You scored " + score + ".\nWould you like to play the next game in your tournament?", 
      "Play next game?", JOptionPane.YES_NO_OPTION);
      if (reply == JOptionPane.YES_OPTION) {  //player chooses to play the next game in their tournament.
        resetGame();
      } else {                                  //player chooses to leave the tournament early.
        tournamentOver();
      }
    } else {                                     //player has no games left.  Tournament over.                      
      tournamentOver();
      exit();
    }
  }                                             //End of Collision Detection
}

//Method to control direction of driver
void keyPressed() {              
  if (key==CODED) {
    if (keyCode==RIGHT)
      driver.setXDirection(1);
    else if (keyCode==LEFT)
      driver.setXDirection(-1);
  }
}

//Method to stop driver from moving after key was released
void keyReleased() {            
  driver.setXDirection(0);
}

//Method to assign the time of the collision and set the the isBooming value to true to invoke the isBooming method.
public void boom() {              
  isBooming = true;
  timeOfCollision = millis();
}

//Method to display BOOM! if there is a collision detection
public void boomDisplay() {
 //displays BOOM! if there is a collision
  if (isBooming) {                              
    if (millis() < timeOfCollision+delay) {
      fill(255, 0, 0);
      ellipse(width/2, height/2, width/3, width/3);
      fill(0, 0, 255);
      textSize(80);
      text("BOOM!", width/2-153, height/2+20);
    } else {
      isBooming = false;
    }
  }
}

/*Method to set the boolean value of isBonusFlashing to true which is used in another method of the same name so it will stay on the screen for 1 second.  Also increments
the score, the bonus count and plays a sound effect*/
public void bonusWooHoo() {
  if(score >1) {
    if (score%20==0) {
      isBonusFlashing = true;
      timeOfBonus = millis();
      score+=5;
      bonus++;
      wooHooSound.play();
    }
  }
}

//Method using millis() to flash a bonus on screen! 
public void bonusWooHoo(String wooHoo) {
  if (isBonusFlashing) {
    if (millis() < timeOfBonus+delay) {
      fill(#FAFF00);
      ellipse(width/2, height/2, width/3, width/3);
      fill(0, 0, 255);
      textSize(70);
      text(wooHoo, width/2-173, height/2+20);
    } 
    else {
      isBonusFlashing = false;
    }
  }
}

//Method to reset the game once 3 lives have been lost.
public void resetGame() {           
  livesLost=0;
  score=0;
  driver.setXDirection(0);
}

//Method to display scores once all the games have been played.
void tournamentOver()              
{
  JOptionPane.showMessageDialog(null, player.getPlayerName() + ", your game is over! \n\n"  
    + "You played: " + numberOfGamesPlayed +" games."
    + "\n\n"                     + player.toString()
    + "\n\nHighest Score: "      + player.highestScore()
    + "\n\nAverage Score: "      + player.averageScore()
    + "\n\nLowest Score: "       + player.lowestScore());
  exit();
}
