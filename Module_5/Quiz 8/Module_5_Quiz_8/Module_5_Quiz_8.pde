Walker walker = new Walker();
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

Walker[] allWalkers = new Walker[10];
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < allWalkers.length; i++)
  {
    allWalkers[i] = new Walker();
    allWalkers[i].mass = random(1, 10);
    allWalkers[i].scale = allWalkers[i].mass * 15;
    allWalkers[i].position.x = -500;
    allWalkers[i].position.y = 200;
  }
}

void draw()
{
  background(80);
  
  for (int i = 0; i < allWalkers.length; i++)
  {
    allWalkers[i].render();
    allWalkers[i].update();
    allWalkers[i].applyForce(wind);
    allWalkers[i].applyForce(gravity);
    allWalkers[i].checkEdges();
    
  }
   
}
