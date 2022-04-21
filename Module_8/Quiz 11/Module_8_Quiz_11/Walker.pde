public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float scale;
  public float velocityLimit = 10;
  
  public float mass;
  public float r = random(255);
  public float g = random(255);
  public float b = random(255);
  
  public float gravitationalConstant = 1;
  
    public Walker()
  {
    
  }
  
  public void applyForce(PVector force)
{
  PVector f = PVector.div(force, this.mass);
  this.acceleration.add(f); //force accumulation
}
  
  public void update()
  {
    //this.acceleration = PVector.random2D();
    this.velocity.add(this.acceleration); //velocity accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); //resets acceleration
  }

  public void render()
  {
    color randomColor = color(r, g, b, 150);
    fill(randomColor);
    stroke(0);
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    if (this.position.y <= Window.bottom)
    {
      this.position.y = Window.bottom;
      this.velocity.y *= -1;
    }
    
    else if (this.position.y >= Window.top)
    {
      this.position.y = Window.top;
      this.velocity.y *= -1;
    }
    
    if (this.position.x <= Window.left)
    {
      this.position.x = Window.left;
      this.velocity.x *= -1;
    }
    
    else if (this.position.x >= Window.right)
    {
      this.position.x = Window.right;
      this.velocity.x *= -1;
    }
  }
  
  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position);
    float distance = force.mag();
    force.normalize();
    
    distance = constrain(distance, 5, 25);
    
    float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
}
