Walker walker = new Walker();

Walker[] allWalkers = new Walker[8];
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
  if (mousePressed)
  {
    resetState();
  }
  
  background(80);
  
  line(0 , -720, 0 , 720);
  
  for (int i = 0; i < allWalkers.length; i++)
  {
    
    //arranges array in ascending order
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
        
    float mew = 0.01f;
    
    if(allWalkers[i].position.x >= Window.windowWidth / 2)
    {
      mew = 0.4f;
    }
    
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = allWalkers[i].velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    
    
    //I couldn't see the circle properly on my screen so I changed the formula slightly to space them out a bit
    allWalkers[i].position.y = 2 * (Window.windowHeight / allWalkers.length) * (i - (allWalkers.length / 2)) + i*5;
    
    PVector acceleration = new PVector(0.2, 0 / allWalkers[i].mass);
    
    allWalkers[i].render();
    allWalkers[i].update();
    allWalkers[i].applyForce(acceleration);
    allWalkers[i].applyForce(friction);
    allWalkers[i].checkEdges();    
  }
   
}

public void resetState()
{
  for (int i = 0; i < allWalkers.length; i++)
  {
    allWalkers[i] = null;
  }
    setup();
}
