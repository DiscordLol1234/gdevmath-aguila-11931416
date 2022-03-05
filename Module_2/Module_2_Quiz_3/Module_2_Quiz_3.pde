void setup()
{
  size (1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  gaussian();
}

void gaussian()
{
  float gaussian = randomGaussian();
  float gaussianT = randomGaussian();
  float rng = random(-360, 360);
  
  float standardDeviation = 300;
  float mean = 0;
  
  float thicknessDeviation = 30;
  float thicknessMean = 0;
  
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(10, 101);
  
  color randomColor = color(r, g, b, a);
  fill(randomColor);
  
  float x = standardDeviation * gaussian + mean;
  float thickness = thicknessDeviation * gaussianT + thicknessMean;

  circle(x, rng, thickness);
}
