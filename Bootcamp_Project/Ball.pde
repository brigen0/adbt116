int radius = 20;
int score = 0;
int bestScore = 0;
class Ball {


  PVector position;

  PVector startingPosition;
  PVector vel;
  boolean inPlayMode;
  boolean endReached;
  int score;
  color colour;
  boolean scoreX = false;

  Ball() {
    startingPosition = new PVector(width/2, height-radius);
    position = new PVector(width/2, height-radius);
    vel = new PVector(2, 2);
    inPlayMode = true;
    score = 0;
    colour = color(random(0, 255), random(0, 255), random(0, 255));
  }

  void draw() {
    fill(255, 1, 1);
    ellipse(position.x, position.y, radius, radius);
    keyPressed();
    ballInScetch();
    finishLine();
    checkBallFinish();
    score();





    //checks is the ball touches any of the obstructions 
    for (int i=0; i<10; i++) {
      if (position.x + radius> obs[i].position.x  && 
        position.x + radius < obs[i].position.x+obs[i].w && 
        position.y + radius > obs[i].position.y && 
        position.y+radius<obs[i].position.y+obs[i].h ||
        position.x + radius> obs[i].position.x+610 &&
        position.x + radius < obs[i].position.x+obs[i].w+610 &&
        position.y + radius > obs[i].position.y &&
        position.y+radius<obs[i].position.y+obs[i].h
        ) {
        position.x = width/2;
        position.y = height - radius;
      }
    }
    for(int i = 0; i<5; i++){
    if (dist(position.x, position.y, lvlUpBall[i].position.x, lvlUpBall[i].position.y)< radius + radius - 10) {
      position.x = width/2;
      position.y = height - radius;
    }
    }
    finish();
  }


  void keyPressed() {

    //move farward
    if (key == 'w') {

      position.y = position.y - vel.y;
      ellipse(position.x, position.y, radius, radius);
    }

    // move backward 
    else if (key == 's' ) {
      position.y = position.y + vel.y;
      ellipse(position.x, position.y, radius, radius);
    }
    //turn left 
    else if (key == 'a') {
      position.x = position.x - vel.x;
      ellipse(position.x, position.y, radius, radius);
      //turn right
    } else if (key == 'd') {
      position.x = position.x + vel.x;
      ellipse(position.x, position.y, radius, radius);
    }
  }
  //when the ball reaches the top, it returns it to its start position
  void finish() {
    if (position.y < 0) {    
      position.x = width/2;
      position.y = height - radius;
      scoreX = true;
    }
  }

  //the finish line 
  void finishLine() {

    for (int i=0; i<60; i=i+1) {
      for (int j=0; j<2; j=j+1) {
        if ((i+j+1)%2 == 0) {
          fill(255, 255, 255);
        } else {
          fill(0, 0, 0);
        }

        rect(0+i*10, 0+j*10, 10, 10);
      }
    }
  }

  //adds the score if the user finishes the end successfully
  void checkBallFinish() {
    if (position.y < 0) {
      score = score + 1;
    }
  }

  //checks if the ball is in the width of the scetch
  void ballInScetch() {
    if (position.x - radius/2 < 0) {
      position.x = position.x + vel.x;
    } else if (position.x + radius/2 > width) {
      position.x = position.x - vel.x;
    }
  }

  void score() {
    textSize(20);
    fill(212, 121, 113);
    text("Score:" + score, 20, height - 10);
  }

 
}  
