class levelUpBall {
  PVector position;
  PVector vel;

  levelUpBall() {
    position = new PVector(random(0, width), random(315, 407));
    vel = new PVector(random(1, 3), random(1, 3));
  }

  void draw() {
    ellipse(position.x, position.y, radius + 20, radius + 20);
    position.x = position.x + vel.x;
    position.y = position.y + vel.y;


    collisionCheck();
  }

  void collisionCheck() {
    if (position.x > width) {
      vel.x = vel.x * -1;
    } else if (position.x < 0) {
      vel.x = vel.x * -1;
    } else if (position.y > 407) {
      vel.y = vel.y * -1;
    } else if (position.y < 315) {
      vel.y = vel.y * -1;
    }
  }
}
