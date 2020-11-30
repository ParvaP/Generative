ArrayList<Obstacle> obs = new ArrayList<Obstacle>(); //contains the obstacles
ArrayList<Ball> balls = new ArrayList<Ball>(); //contains the balls

float speed = 1; //speed of ball
float rad = 5; //radius of ball

int numBalls = 1; //number of balls
int numObs = 0; //number of obstacles

void setup(){
  size (900, 900); //width,height
  background (0); //changes the backgroud to black
  stroke (255); //changes the color of the lines to white

  float[] ballPos = randBallPos();

  for (int i = 0; i < numBalls; i++){
      balls.add(new Ball(ballPos[0],ballPos[1],randBool(),randBool()));
  }

  for (int i = 0; i < numObs; i++){}
}

void draw(){
    drawBalls();
}

void drawBalls(){
    for (int i = 0; i < balls.size(); i++){
        Ball b = balls.get(i);
        circle(b.x,b.y,b.r);
    }
}

void moveBalls(){
    for (int i = 0; i < balls.size(); i++){
        
    }
}

void circle(float x, float y, float r) {
    ellipse(x, y, r*2, r*2);
}

float[] randBallPos (){
    float[] pos = new float[2];

    pos[0] = random(rad, width-rad); //x
    pos[1] = random(rad, height-rad); //y

    return pos;
}

boolean randBool() {
  return random(1) > 0.5;
}

class Obstacle {
    float x; //x position
    float y; //y position
    float w; //width
    float h; //height

    //Constructor
    Obstacle (float x,float y,float w,float h){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }
}

class Ball {
    float x; //x position
    float y; //y position
    float r = rad; //radius
    boolean right; //going right
    boolean down; //going down

    //Constructor
    Ball (float x,float y,boolean right,boolean down){
        this.x = x;
        this.y = y;
        this.right = right;
        this.down = down;
    }
}