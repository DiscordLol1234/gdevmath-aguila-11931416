void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  float r = random(255);
  float g = random(255);
  float b = random(255);
  
  color randomColor = color(r, g, b);
  fill(randomColor);
  stroke(randomColor);
}

Walker myWalker = new Walker();

void draw()
{
  background(255);
   
  myWalker.render();
  myWalker.moveAndBounce();
 
}
