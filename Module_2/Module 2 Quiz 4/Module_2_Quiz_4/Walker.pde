public class Walker
{
  public float x;
  public float y;
  public float tx = 0;
  public float ty = 10000;
  
  public float st = 0;
  
  public float ctr = 85;
  public float ctg = 170;
  public float ctb = 255;
  
  public float thickness = 15;
  
  public float r = 255;
  public float g = 255;
  public float b = 255;
  
  
  void render()
  {
    
  }
  
  void perlinWalk()
  {  
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    thickness = map(noise(st), 0, 1, 5, 150);
  
  //i'm not completely sure if my color randomization is correct
  
    r =  map(noise(ctr), 0, 1, 0, 255);
    g =  map(noise(ctg), 0, 1, 0, 255);
    b = map(noise(ctb), 0, 1, 0, 255);
  
    color randomColor = color(r, g, b);
    fill(randomColor);
    stroke(randomColor);
  
    tx += 0.01f;
    ty += 0.01f;
    ctr += 0.01f;
    ctg += 0.01f;
    ctb += 0.01f;
    st += 0.01f;
    
    circle(x, y, thickness); 
  }
}
