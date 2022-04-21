Walker[] allMatter= new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < allMatter.length; i++)
  {
    allMatter[i] = new Walker();
    allMatter[i].mass = random(1, 7);
    allMatter[i].scale = allMatter[i].mass * 10;
    allMatter[i].position.x = random(-600, 600);
    allMatter[i].position.y = random(-330, 330);
  }
  
}

void draw()
{
  background(255);
  
   for (int i = 0; i < allMatter.length; i++)
  {
    allMatter[i].render();
    allMatter[i].update();
    
    for (int j = 0; j < allMatter.length; j++)
    {
      if (i != j)
      {
        allMatter[j].applyForce(allMatter[i].calculateAttraction(allMatter[j]));
      }
    }
  }
}
