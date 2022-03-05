float time = 0.0;
float freq = 2;
float amp = 10;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

void draw()
{
  background(130);
  
//circle(0, 0, 15);
  
  //line

time += 1;

drawCartesianPlane();
drawLinearFunction();
drawQuadraticFunction();
drawSinWave();
}


void keyPressed()
{
  if (keyCode == UP)
  {
    amp += 1;
  }
  
  if (keyCode == DOWN)
  {
    amp -= 1;
  }
  
  if (keyCode == LEFT)
  {
    freq += 1;
  }
  
  if (keyCode == RIGHT)
  {
    freq -= 1;
  }
}

void drawCartesianPlane()
{
  strokeWeight(2);
  color white = color (255,255,255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i < 300; i+= 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }

}

void drawLinearFunction()
{
  color purple = color(164, 12, 210);
  fill(purple);
  noStroke();
  
  for (float x = -200; x <= 200; x+= 0.01)
  {
    circle(x, (-5 * x + 30), 3);
  }
}

void drawQuadraticFunction()
{
  color yellow = color (230,215,4);
  fill (yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x +=0.1f)
  {
    circle(x, (float)Math.pow(x,2) - (x * 15) - 3, 3);
  }
}

//void drawCircle()
//{
//  color white = color (255,255,255);
//  fill(white);
//  stroke(white);
//  float radius = 50;

//for (float x = -300; x <= 300; x += 0.1f)
//{
//  circle((float) Math.cos(x) * radius, (float)Math.sin(x) * radius, 3);
//}
//}

void drawSinWave()
{
  color blue = color (0,0,255);
  fill (blue);
  stroke(blue); 
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle((x + sin(time)) * freq, sin(x) * amp,1);
  } 
  //I couldn't really figure out how to make the wave move properly
}
