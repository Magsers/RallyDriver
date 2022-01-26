public class TrackLines
{
  private int xCoord;
  private int yCoord;
  private int lineWidth;
  private int lineHeight;
  private int yDir=1;
  
  //getters
  
  public int getXCoord()
  {
    return xCoord;
  }
  
  public int getYCoord()
  {
    return yCoord;
  }
  
  public int getLineWidth()
  {
    return lineWidth;
  }
  
  public int getLineHeight()
  {
    return lineHeight;
  }
    
  //setters
  
  public void setXCoord(int xCoord)
  {
    this.xCoord = xCoord;
  }
  
  public void setYCoord(int yCoord)
  {
    this.yCoord = yCoord;
  }
  
  public void setLineWidth(int lineWidth)
  {
    this.lineWidth = lineWidth;
  }
  
  public void setLineHeight(int lineHeight)
  {
    this.lineHeight = lineHeight;
  }
  
  //Constructor Method
  public TrackLines(int xCoord, int yCoord, int lineWidth, int lineHeight){
    setXCoord(xCoord);
    setYCoord(yCoord);
    setLineWidth(lineWidth);
    setLineHeight(lineHeight);
  }
  
  //method display() to display the white track lines
  public void display(){
    fill(255);
    rect(this.xCoord, this.yCoord, this.lineWidth, this.lineHeight);

  }
  
  //method update() to update the yCoordinate of the white track lines
  public void update(){
    this.yCoord = this.yCoord+this.yDir;
  }  
  
}  //END OF TRACKLINES CLASS
