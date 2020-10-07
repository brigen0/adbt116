
class Obstructions {
  PVector position; 
  PVector vel; 
  float w;
  float h; 
  float position1X;
  float r;
  float g;
  float b;
  color colour;



  Obstructions() {
    position = new PVector(random(-540, -1), 510); //bottom left rectancgle (base)

    vel = new PVector(random(-3, 3), random(-3, 3)); 
    w = 540;
    h = 20;
    position1X = position.x + 610; //bottom right rectangle, 2nd obs part 
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    colour = color(r, g, b);
  }

  void draw() {
    fill(colour);
    rect(position.x, position.y, w, h);
    rect(position1X, position.y, w, h);
    obstMove();
    fill(255);
  }

  void obstMove()
  {
    position.x = position.x + vel.x;
    position1X = position1X + vel.x;

    // base rect bouncing back, this also affects the other rect as well because it's built beased on the base ball's x and y coordinates.  
    if (position.x < -540)
    {
      vel.x = vel.x * -1;
    } else if (position.x > -1)
    {
      vel.x = vel.x * -1;
    }
  }
}
