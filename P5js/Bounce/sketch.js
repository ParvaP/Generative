var obs = new Array(); //contains the obstacles
var balls = new Array(); //contains the balls

var distan = 1; //distance between frame
var rad = 5; //radius of ball

var numBalls = 5; //number of balls
var numObs = 5; //number of obstacles

var minW = 100; //min width of an obstacle
var minH = 100; //min height of an obstacle
var maxW = 400; //max width of an obstacle
var maxH = 300; //max height of an obstacle

var count = 0;
var ssDelay = 6;

class Obstacle{
  constructor(x,y,w,h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.s = [random(255),random(255),random(255)]
    this.f = [random(255),random(255),random(255)]
  }

  inObstacle(bX,bY){
    return bX + rad > this.x && bX - rad < this.x + this.w && bY + rad > this.y && bY - rad < this.y + this.h;
  }
}

class Ball{
  constructor(x,y,dX,dY){
    this.x = x;
    this.y = y;
    this.dX = dX;
    this.dY = dY;
    this.s = [random(255),random(255),random(255)]
    this.f = [random(255),random(255),random(255)]
  }

  move(x,y){
    this.x += x;
    this.y += y;
  }
}

function drawBalls() {
  for (i = 0; i < balls.length; i++) {
    stroke(balls[i].s[0],balls[i].s[1],balls[i].s[2]);
    fill(balls[i].f[0],balls[i].f[1],balls[i].f[2]);
    circ(balls[i].x, balls[i].y, rad);
  }
}

function drawObstaacles () {
  for (i = 0; i < obs.length; i++) {
    stroke(obs[i].s[0],obs[i].s[1],obs[i].s[2]);
    fill(obs[i].f[0],obs[i].f[1],obs[i].f[2]);
    rect(obs[i].x, obs[i].y, obs[i].w, obs[i].h);
  }
}

function moveBalls() {
  for (i = 0; i < balls.length; i++) {
    balls[i].move(balls[i].dX*distan, balls[i].dY*distan);
  }
}

function circ(x,y,r) {
  ellipse(x, y, r*2, r*2);
}

function collision() {
  //collision with walls
  for (i = 0; i < balls.length; i++) {

    //collision with walls
    if (balls[i].x+balls[i].dX*distan+rad > width || balls[i].x+balls[i].dX*distan-rad < 0) {
      balls[i].dX = balls[i].dX*-1;
    }

    //collision with floor and ceiling
    if (balls[i].y+balls[i].dY*distan+rad > height || balls[i].y+balls[i].dY*distan-rad < 0) {
      balls[i].dY = balls[i].dY*-1;
    }

    //collision with obstacles
    for (ii = 0; ii < obs.length; ii++) {
      if (obs[ii].inObstacle(balls[i].x+balls[i].dX*distan, balls[i].y)) {
        balls[i].dX = balls[i].dX*-1;
      }

      if (obs[ii].inObstacle(balls[i].x, balls[i].y+balls[i].dY*distan)) {
        balls[i].dY = balls[i].dY*-1;
      }
    }
  }
}

function randBallPos() {
  let pos = [0,0];

  valid = false;

  //stops a ball from spawning in an obstacle
  while (!valid) {
    valid = true;
    pos[0] = random(rad, width-rad); //x
    pos[1] = random(rad, height-rad); //y
    for (i = 0; i < obs.length; i ++) {
      if (obs[i].inObstacle(pos[0],pos[1])){
          valid = false;
      }
    }
  }
  return pos;
}

function randObsPos(w,h) {
  let pos = [0,0];

  pos[0] = random (0, width-w);
  pos[1] = random (0, height-h);

  return pos;
}

function randDir() {
  if (random(1) > 0.5){
    return 1;
  } else {
    return -1;
  }
}

function setup() {
  myCanvas = createCanvas(1200, 900);
  //frameRate(10);

  ballPos = new Array();
  obsPos = new Array();

  for (i = 0; i < numObs; i++) {
    wid = random(minW, maxW);
    hei = random(minH, maxH);
    obsPos = randObsPos(wid, hei);
    obs.push(new Obstacle(obsPos[0], obsPos[1], wid, hei));
  }

  for (ii = 0; ii < numBalls; ii++) {
    ballPos = randBallPos();
    balls.push(new Ball(ballPos[0], ballPos[1], randDir(), randDir()));
  }
  background(0);
  fill(0,0,255);
  stroke(0,0,255);
  drawObstaacles();
  stroke (255);
  fill(255);
}

function screenShot (){
  if (count%delay == 0){
    saveCanvas(mycanvas,"screenshot-"+count,"png");
  }
  count ++;
}

function draw() {
  drawObstaacles();
  drawBalls();
  collision();
  moveBalls();
  //screentShot();
}
