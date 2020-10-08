import processing.sound.*;
SoundFile backgroundSound;

PImage img; 
Obstructions[] obs; 
Ball ball; 
float dis;
boolean collision;
levelUpBall lvlUpBall;




void setup() {
  size(600, 500);
  img = loadImage("forest.png");
  backgroundSound = new SoundFile(this, "game.wav");
  backgroundSound.play();
  backgroundSound.loop(); //keeps repeating the sound 



  obs = new Obstructions[10];
  ball = new Ball();
  lvlUpBall = new levelUpBall();




  for (int i=0; i<10; i++) {
    obs[i] = new Obstructions();
  }
  savedValues();
} 


void draw() {

  background(255);

  image(img, 0, 0);
  for (int i = 0; i < 10; i++) {
    obs[i].draw();
  }
  ball.draw();

  //if the user score one point another obstruction comes its way

  lvlUpBall.draw();
}  

void savedValues() {

  obs[0].position.y = obs[0].position.y - 600;
  obs[1].position.y = obs[1].position.y - 80;
  obs[2].position.y = obs[1].position.y - 160;
  obs[3].position.y = obs[1].position.y - 240;
  obs[4].position.y = obs[1].position.y - 320;
  obs[5].position.y = obs[1].position.y - 400;
  obs[7].position.y = obs[1].position.y - 480;
  obs[8].position.y = obs[1].position.y - 700;
  obs[9].position.y = obs[1].position.y - 700;
}
