ArrayList<Obstacle> obs = new ArrayList<Obstacle>(); //contains the obstacles
ArrayList<Ball> balls = new ArrayList<Ball>(); //contains the balls

float dist = 5; //distance between frame
float rad = 5; //radius of ball

int numBalls = 2; //number of balls
int numObs = 5; //number of obstacles

float minW = 100; //min width of an obstacle
float minH = 100; //min height of an obstacle

float maxW = 400; //max width of an obstacle
float maxH = 300; //max height of an obstacle

void setup() {
  size (1200, 900); //width,height
  background (0); //changes the backgroud to black
  frameRate(1000); //basically uncapped

  float[] ballPos;
  float[] obsPos;

  for (int i = 0; i < numObs; i++) {
    float wid = random(minW, maxW);
    float hei = random(minH, maxH);
    obsPos  = randObsPos(wid, hei);
    obs.add(new Obstacle(obsPos[0], obsPos[1], wid, hei));
  }

  for (int i = 0; i < numBalls; i++) {
    ballPos = randBallPos();
    balls.add(new Ball(ballPos[0], ballPos[1], randDir(), randDir()));
  }

  fill(0,0,255);
  stroke(0,0,255);
  drawObstaacles();
  stroke (255);
  fill(255);
}

void draw() {
  drawBalls();
  collision();
  moveBalls();
  //println(frameRate);
}

void drawBalls() {
  for (int i = 0; i < balls.size(); i++) {
    Ball b = balls.get(i);
    circle(b.x, b.y, b.r);
  }
}

void drawObstaacles () {
  for (int i = 0; i < obs.size(); i++) {
    Obstacle o = obs.get(i);
    rect(o.x, o.y, o.w, o.h);
  }
}

void moveBalls() {
  for (int i = 0; i < balls.size(); i++) {
    Ball b = balls.get(i);

    b.move(b.dX*dist, b.dY*dist);
  }
}

void circle(float x, float y, float r) {
  ellipse(x, y, r*2, r*2);
}

void collision() {

  //collision with walls
  for (int i = 0; i < balls.size(); i++) {
    Ball b = balls.get(i);

    //collision with walls
    if (b.x+b.dX*dist+b.r > width || b.x+b.dX*dist-b.r < 0) {
      b.dX = b.dX*-1;
    }

    //collision with floor and ceiling
    if (b.y+b.dY*dist+b.r > height || b.y+b.dY*dist-b.r < 0) {
      b.dY = b.dY*-1;
    }

    //collision with obstacles
    for (int ii = 0; ii < obs.size(); ii++) {
      Obstacle o = obs.get(ii);
      if (o.inObstacle(b.x+b.dX*dist, b.y)) {
        b.dX = b.dX*-1;
      }

      if (o.inObstacle(b.x, b.y+b.dY*dist)) {
        b.dY = b.dY*-1;
      }
    }
  }
}

float[] randBallPos() {
  float[] pos = new float[2];

  boolean valid = false;

  //stops a ball from spawning in an obstacle
  while (!valid) {
    valid = true;
    pos[0] = random(rad, width-rad); //x
    pos[1] = random(rad, height-rad); //y
    for (int i = 0; i < obs.size(); i ++) {
      Obstacle o = obs.get(i);
      if (o.inObstacle(pos[0],pos[1])){
          valid = false;
      }
    }
  }
  return pos;
}

float[] randObsPos(float w, float h) {
  float[] pos = new float[2];

  pos[0] = random (0, width-w);
  pos[1] = random (0, height-h);

  return pos;
}

float randDir() {
  return random(1) > 0.5 ? 1 : -1;
}

class Obstacle {
  float x; //x position
  float y; //y position
  float w; //width
  float h; //height

  //Constructor
  Obstacle (float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  boolean inObstacle (float bX, float bY) {
    return bX + rad > x && bX - rad < x + w && bY + rad > y && bY - rad < y + h;
  }
}

class Ball {
  float x; //x position
  float y; //y position
  float r = rad; //radius
  float dX; //movement direction in x
  float dY; //movement direction in y

  //Constructor
  Ball (float x, float y, float dX, float dY) {
    this.x = x;
    this.y = y;
    this.dX = dX;
    this.dY = dY;
  }

  void move(float x, float y) {
    this.x += x;
    this.y += y;
  }
}
