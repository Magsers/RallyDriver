public class Driver
{
  private int xCoord;           //xCoordinates of the bonnet of the car
  private int yCoord;           //yCoordinates of the bonnet of the car
  private int driverWidth;      //width of the driver's car
  private int driverHeight;     //height of the driver's car
  private float xDirection = 0; //Direction of car along the x axis.  

  //getters
  
  public int getXCoord(){
    return xCoord;
  }
  
  public int getYCoord(){
    return yCoord;
  }
  
  public int getDriverWidth(){
    return driverWidth;
  }
  
  public int getDriverHeight(){
    return driverHeight;
  }
  
  public float getXDirection(){
    return xDirection;
  }
  
  //setters
  
  public void setXCoord(int xCoord) {
    this.xCoord = xCoord;
  }
  
  public void setYCoord(int yCoord) {
    this.yCoord = yCoord;
  }
  
  public void setDriverWidth(int driverWidth){
    //The car width must be between 80 and height/6 (inclusive)
    if((driverWidth >= 80) && (driverWidth <= width/2)){
        this.driverWidth = driverWidth;
    }
    else{
        this.driverWidth = 80;
    }
  }
  
  //The car height must be between 40 and height/6 (inclusive)
  public void setDriverHeight(int driverHeight){
    if((driverHeight >= 40) && (driverHeight <= height/2)){
        this.driverHeight = driverHeight;
    }
    else{
        this.driverHeight = 40;
    }
  }
    
  public void setXDirection(float xDirection){
    this.xDirection=xDirection;
  }
  
  //Constructor Method
  
  public Driver() 
  {
    setDriverWidth(driverWidth);
    setDriverHeight(driverHeight);
  }
  
  public Driver(int driverWidth, int driverHeight)
  {
    setDriverWidth(driverWidth);
    setDriverHeight(driverHeight);
    
    //The x coordinate of the driver is set to width/2 but changes throughout the program as the player uses the left and right arrow keys
    this.xCoord = width/2;
    
    //the yCoordiante variable is set here and it stays this value for the duration of the program.
    this.yCoord = height - this.driverHeight-20;
  }
  
  //method display() that's always being called to display the car. 
  public void display(){
    fill(255,0,0);
    noStroke();
    rect(xCoord, yCoord, driverWidth, driverHeight);
    rect(xCoord+10, yCoord-20, driverWidth-20, driverHeight-10);
    fill(100);
    rect(xCoord+13, yCoord-17, driverWidth-26, driverHeight-14);
    rect(xCoord+5, yCoord+40, driverWidth/4, driverHeight/4);
    rect(xCoord+55, yCoord+40, driverWidth/4, driverHeight/4);
    fill(#DEE309);
    ellipse(xCoord+driverWidth/2, yCoord-5, 20,20);
  }
   
  //method update() that's always being called to update the cars coordinates //<>// //<>//
  public void update() { //<>// //<>//
    xCoord =xCoord+=(this.xDirection*5);
    if (xCoord <= 200)   //<>// //<>//
        xCoord = 200;
    if(xCoord>=1000)
        xCoord=1000;
  } 
  
}  //END OF DRIVER CLASS
    
   
