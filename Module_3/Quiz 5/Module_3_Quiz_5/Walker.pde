class Walker
{
PVector position = new PVector();
PVector speed = new PVector(5, 8);
float r,g,b;

  void render()
  {      
    circle(position.x, position.y, 30);
  }
  
  
  void moveAndBounce()
  {
    r = random(255);
    g = random(255);
    b = random(255);
    
       
    position.add(speed);
    
    if ( position.x > Window.right ||  position.x < Window.left)
  {
    speed.x *= -1;
    color randomColor = color(r, g, b);
    fill(randomColor);
    stroke(randomColor);
  }
  
  if ( position.y > Window.top ||  position.y < Window.bottom)
  {
    speed.y *= -1;
    color randomColor = color(r, g, b);
    fill(randomColor);
    stroke(randomColor);
  }
    
  }  
    
}
