public class Car
{
  private float xCoord;          //x coordinate of the bonnet of the car
  private float yCoord;          //y coordinate of the bonnet of the car
  private float widthBonnet;     //width of the car bonnet
  private float heightBonnet;    //height of the car bonnet
  private float speedX;          //speed along the x-axis
  private float speedY;          //speed along the y-axis
  private float red, green, blue;//colours of array of cars
   
  //getters
  
  public float getXCoord(){
     return xCoord;
  }
   
  public float getYCoord(){
     return yCoord;
  }
   
  public float getWidthBonnet(){
     return widthBonnet;
  }
   
  public float getHeightBonnet(){
     return heightBonnet;
  }
 
  //setters
  
  public void setXCoord(int xCoord) {
    this.xCoord = xCoord;
  }
  
  public void setYCoord(int yCoord) {
    this.yCoord = yCoord;
  }
   
  public void setWidthBonnet(float widthBonnet){
  //The car width must be between 80 and height/6 (inclusive)
    if((widthBonnet >= 80) && (widthBonnet <= height/6)){
       this.widthBonnet = widthBonnet;
    }
    else{
        this.widthBonnet = 80;
    }
  }
   
  public void setHeightBonnet(float heightBonnet){
   //The car height must be between 40 and height/6 (inclusive)
   if((heightBonnet >= 40) && (heightBonnet <= height/6)){
       this.heightBonnet = heightBonnet;
   }
   else{
       this.heightBonnet = 40;
   }
  }
  
  public void setColour(float red, float green, float blue)
  {
    this.red = red;
    this.green = green;
    this.blue = blue;
    fill (this.red, this.green, this.blue);
  }
   //<>//
  //Constructor Methods  
  public Car(float widthBonnet, float heightBonnet){
    setWidthBonnet(widthBonnet);
    setHeightBonnet(heightBonnet);
    resetCar();
  }
  
  public Car(float widthBonnet, float heightBonnet, float r, float g, float b){
    setWidthBonnet(widthBonnet);
    setHeightBonnet(heightBonnet);
    setColour(r, g, b);
    resetCar();
  } 
   
  //method display() that's always being called to display the car.     
  public void display(){          
    noStroke();
    rect(xCoord, yCoord, widthBonnet, heightBonnet);
    rect(xCoord+10, yCoord-20, widthBonnet-20, heightBonnet-10);
    fill(100);
    rect(xCoord+13, yCoord-17, widthBonnet-26, heightBonnet-14);
    rect(xCoord+5, yCoord+40, widthBonnet/4, heightBonnet/4);
    rect(xCoord+55, yCoord+40, widthBonnet/4, heightBonnet/4);  
  }
  
  //method update() that returns scored as true if the car is updated 
  public boolean update(){        
     boolean scored = false;
    //update car coordiantes
    xCoord = xCoord + speedX;
    yCoord = yCoord + speedY;
    
    if(xCoord <= 200){            //if statement to keep cars within the road border
        xCoord=200;
        speedX = speedX* -1;}
    if(xCoord>=1000){
       xCoord=1000;
       speedX = speedX*-1;}
    
    //if car goes off the bottom of the display window return a positive scored value and calls resetCar method to reset the coordinates of the car.  
    if (yCoord > height - heightBonnet){
        scored=true;
        resetCar();
     }  
     return scored;
  }                              //end of update method
  
  //method reset() that's called to reset the car's coordinates once it goes off the bottom of the screen
  private void resetCar(){          
    xCoord = random(width); //<>//
    if((xCoord<200) || (xCoord>1000))    //keeps cars within the road
       xCoord = random(200, 1000);   
       yCoord = 0;
       speedX = random(-2, 8);
       speedY = random(2, 5);
  }
  //<>//
  //method disappear() to disappear a car that the driver has crashed into.
  public void disappear() {      
    this.xCoord=width/2;
    this.yCoord=0;
  }

}  //END OF CAR CLASS
  
