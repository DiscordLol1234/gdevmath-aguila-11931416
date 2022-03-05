class Walker
{
  float x;
  float y;
  
  void render()
  {
      circle(x, y, 30);
  }
  
  
  void randomWalk()
  {
    
    int rng = int(random(7));
    
    if (rng == 0) // up
    {
      y+= 10;
    }
    
    else if (rng == 1) //down
    {
      y-= 10;
    }
    
    else if (rng == 2) //right
    {
      x+= 10;
    }
    
    else if (rng == 3) //left
    {
      x-= 10;
    }
    
     else if (rng == 4) //up-right
    {
      y+= 5;
      x+= 5;
    }
    
    else if (rng == 5) //up-left
    {
      y+= 5;
      x-= 5;
    }
    
    else if (rng == 6) //down-right
    {
      y-= 5;
      x+= 5;
    }
    
    else if (rng == 7) //down-left
    {
      y-= 5;
      x-= 10;
    }
    
  }  
  
  void randomWalkBiased()
  {
    //40% down, 20% each for others
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50, 101);
    
    color randomColor = color(r, g, b, a);
    fill(randomColor);
    stroke(randomColor);
    
    int rng = int(random(4));
    
    if (rng == 0) // up
    {
      y+= 5;
    }
    
    else if (rng == 1 || rng == 2) //down
    {
      y-= 5;
    }
    
    else if (rng == 3) //right
    {
      x+= 5;
    }
    
    else if (rng == 4) //left
    {
      x-= 5;
    }
  }
  
}
