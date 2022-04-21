Walker myWalker = new Walker();
Walker[] allWalkers = new Walker[100];

PVector direction = new PVector();

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < allWalkers.length; i++)
  {
    allWalkers[i] = new Walker();
  }
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(80); 
  
  for (int i = 0; i < allWalkers.length; i++)
  {
    direction = PVector.sub(mousePos(), allWalkers[i].position);
    direction.normalize();
    
    allWalkers[i].acceleration = new PVector(0.2 * direction.x, 0.2 * direction.y);
    
    allWalkers[i].render();
    allWalkers[i].update();
    allWalkers[i].checkEdges();
  }    
}
