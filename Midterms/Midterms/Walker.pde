class Walker
{
  float x;
  float y;
  boolean bhExists = false;
  boolean mExists = false;
  
  float gaussian;
  float sD;
  float mean;
          
  float r;
  float g;
  float b;
  float scale;
  
  public PVector position;
  public PVector bhPosition;
  public PVector speed = new PVector(3, 3);
  public PVector direction = new PVector(5, 5);
  
  
  Walker()
   {
      position = new PVector(); 
   }
      
   Walker(float x, float y)
   {
      position = new PVector(x, y);
   }
   
   
  Walker(float x, float y, float scale)
   {
      position = new PVector(x, y);
      this.scale = scale;
   }
   
  Walker(PVector position)
   {
      this.position = position; 
   }
   
   Walker(PVector position, float scale)
   {
      this.position = position; 
      this.scale = scale;
   }
  
  void drawBH()
  { 
       
    if (bhExists == false)
    {
        x = random(-600, 600);
        y = random(-330, 330);
        
        this.position.x = x;
        this.position.y = y;       
        
        circle(position.x, position.y, 50);        
        
        //println(x + ", " + y);
        //println(this.position.x + ", " + this.position.y);    
        
        bhExists = true;
    }
  
    
      circle(this.position.x, this.position.y, 50);     
    
   
  }
  
  void drawMatter()
  {   
    if (mExists == false)
  {
    gaussian = randomGaussian();
    
    sD = 300;
    mean = 0;
    
    float x = sD * gaussian + mean;
    float y = random(-360, 360);
        
    this.position.x = x;
    this.position.y = y;
        
        
    //println(x + ", " + y);
    //println(this.position.x + ", " + this.position.y);    
    
    r = random(255);
    g = random(255);
    b = random(255);
    scale = random (3, 15);
  
    color randomColor = color(r, g, b, 150);
    fill(randomColor);
    stroke(randomColor);
   
   
    circle(position.x, position.y, scale); 
    mExists = true;
  }  
    
    circle(this.position.x, this.position.y, scale); 
 
  
  }
  
  

}
