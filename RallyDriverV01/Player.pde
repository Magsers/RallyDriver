public class Player
{
  private String playerName;
  private int[] scores;
  private int count;      //  count represents the next available index in the array and represents the number of high scores added to the array

  //Default Constructor Method 
  public Player()
  {
    count=0;
  }
  
  /*Constructor Method to create a player with a starting name and sets the size of the array to
  the number of games in the tournament, as entered by the player*/
  public Player(String playerName, int numberOfGames)
  {
    if (playerName.length() < 7) {
      this.playerName = playerName;
    } else {
      this.playerName = playerName.trim().substring(0, 7);
    }
    if(numberOfGames < 3) {
      numberOfGames=3;
    }
    else{
      scores= new int[numberOfGames];
    }
    count = 0;
  }

  //getters

  public String getPlayerName()
  {
    return playerName;
  }

  public int[] getscores()
  {
    return scores;
  }

  //setters

  public void setPlayerName(String playerName)
  {
    this.playerName = playerName.substring(0, 7);
  }

  public void setScores(int[] scores)
  {
    this.scores = scores;
  }

  //method to add a score at the next available location in the scores array
  public void addScore(int score)
  {
    if (score >= 0)
    {
      scores[count] = score;
      count++;
    }
  }

  //method builds a  String representation of the player name and their high scores.
  public String toString()
  {
    String str = "Scores for "+playerName+"\n";

    for (int i=0; i < count; i++) {
      str = str + "     Game  " + (i+1) + ": " + scores[i] + "\n";
    }
    return str;
  }

  //method to return the highest score
  public int highestScore()
  {
    int highestScore = scores[0];
    int i=1;
    do {
      if (scores[i] > highestScore) {
        highestScore = scores[i];
      }  
      i++;
    } while (i < count);

    return highestScore;
  }

  //method to return the lowest score
  public int lowestScore()
  {
    int lowestScore = scores[0];
    int i=1;
    do {
      if (scores[i] < lowestScore) {
        lowestScore = scores[i];
      }  
      i++;
    } while (i < count);

    return lowestScore;
  }

  //method to return the average score using a for each loop
  public int averageScore()
  {
    int total = 0;
    for (int score : scores) {
      total = total + score;
    }   
    return total / count;
  }
  //<>//
}  //END OF PLAYER CLASS
