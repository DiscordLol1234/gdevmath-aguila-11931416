Walker walker = new Walker();
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

void draw()
{
  background(0);
  
   walker.drawBH();
   
  for (int i = 0; i < allWalkers.length; i++)
  {
    direction = PVector.sub(walker.position, allWalkers[i].position);
    
    allWalkers[i].position.x += direction.x * 0.05;
    allWalkers[i].position.y += direction.y * 0.05;
    allWalkers[i].drawMatter();
    
    //println(direction);
  }  
  
}
