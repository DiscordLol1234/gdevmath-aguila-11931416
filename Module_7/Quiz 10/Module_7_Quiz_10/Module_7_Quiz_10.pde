Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker walker = new Walker();
Walker[] allWalkers = new Walker[10];

PVector wind = new PVector(0.1, 0);

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
    allWalkers[i].position.x = (Window.windowWidth / 10) * (i - 5) * 1.75;
  }
}

void draw()
{
  background(255);
  
  ocean.render();
  
  for (int i = 0; i < allWalkers.length; i++)
  {
    float tempScale1 = 0;
    float tempScale2 = 0;
    
    float tempMass1 = 0;
    float tempMass2 = 0;
    
    if (i != allWalkers.length - 1)
    {
      if (allWalkers[i + 1].scale >= allWalkers[i].scale)
      {
        tempScale1 = allWalkers[i + 1].scale;
        tempScale2 = allWalkers[i].scale;    
        tempMass1 = allWalkers[i + 1].mass;
        tempMass2 = allWalkers[i].mass;
        
        allWalkers[i + 1].scale = tempScale2;
        allWalkers[i].scale = tempScale1;
        allWalkers[i + 1].mass = tempMass2;
        allWalkers[i].mass = tempMass1;
      }
    }
    
    
    allWalkers[i].render();
    allWalkers[i].update();
    allWalkers[i].checkEdges();
    
    PVector gravity = new PVector(0, -0.15f * allWalkers[i].mass);   
    allWalkers[i].applyForce(gravity);
    allWalkers[i].applyForce(wind);
    
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = allWalkers[i].velocity.copy();
    
    allWalkers[i].applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
    
    if(ocean.isCollidingWith(walker))
    {
      PVector dragForce = ocean.calculateDragForce(allWalkers[i]);    
      allWalkers[i].applyForce(dragForce);
    }
  }  
}
