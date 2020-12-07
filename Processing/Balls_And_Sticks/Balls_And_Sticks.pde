ArrayList<float[]> li = new ArrayList<float[]>(); //This is the list that will hold all the information about each ball
/*
[x,y,r,s,a];
 x,y = x and y of the middle of the circle
 r = radius of the circle
 s = speed of the circle
 a = the number used to generate the position of the next circle
 */

//min and max radius of a circle
float minRad = 10;
float maxRad = 60;

//min and max speed of a circle
float minSpeed = 0.01;
float maxSpeed = 0.1;

//Stores information about a  circle
float x;
float y;
float r;
float s;
float a;

float distanceToWall = width/2; //May use this later to get a random n

PGraphics grap;

int n = 15; //number of balls

//Start of trail
float initX;
float initY;

int count = 0;

void setup() {
  size (900, 900); //width,height
  background (0); //changes the backgroud to black
  stroke (255); //changes the color of the lines to white
  noFill(); //stops the shapes from being filled
  grap = createGraphics(900, 900);

  x = width/2;
  y = height/2;
  r = randRadius();
  a = randPos();
  s = randSpeed();

  li.add(0, new float[]{x, y, r, s, a});

  for (int i = 1; i < n; i++) {
    /*
        X = [0];
     Y = [1];
     R = [2];
     S = [3];
     A = [4];
     */

    //x[i] = r[i-1]*cos(a[i-1]) + x[i-1];
    x = li.get(li.size()-1)[2]*cos(li.get(li.size()-1)[4]) + li.get(li.size()-1)[0];

    //y[i] = r[i-1]*sin(a[i-1]) + y[i-1];
    y = li.get(li.size()-1)[2]*sin(li.get(li.size()-1)[4]) + li.get(li.size()-1)[1];

    r = randRadius();
    s = randSpeed();
    a = randPos();

    li.add(i, new float[]{x, y, r, s, a});
  }
  
  initX = li.get(li.size()-1)[0];
  initY = li.get(li.size()-1)[1];
  
  grap.beginDraw();
  grap.background(0);
  grap.endDraw();
}

void draw() {
  clear();
  image(grap,0,0);

  /*
    X = [0];
   Y = [1];
   R = [2];
   S = [3];
   A = [4];
   */

  for (int i = 0; i < li.size(); i++) {
    //circle(x[i],y[i],r[i]);
    circle(li.get(i)[0], li.get(i)[1], li.get(i)[2]);
  }

  for (int i = 1; i < li.size(); i++) {
    //a[i-1] = a[i-1] + s[i];
    li.get(i-1)[4] = li.get(i-1)[4] + li.get(i)[3];

    //x[i] = r[i-1]*cos(a[i-1]) + x[i-1];
    li.get(i)[0] = li.get(i-1)[2]*cos(li.get(i-1)[4]) + li.get(i-1)[0];

    //y[i] = r[i-1]*sin(a[i-1]) + y[i-1];
    li.get(i)[1] = li.get(i-1)[2]*sin(li.get(i-1)[4]) + li.get(i-1)[1];

    //line(x[i-1],y[i-1],x[i],y[i]);
    line(li.get(i-1)[0], li.get(i-1)[1], li.get(i)[0], li.get(i)[1]);
  }
  grap.beginDraw();
  grap.strokeWeight(1);
  grap.stroke(0,255,65);
  //grap.line(initX,initY,li.get(li.size()-1)[0],li.get(li.size()-1)[1]); //Comment this out if you don't want a trail
  if (count%2 == 0){
    saveFrame("output/out-"+nf(count,6)+".png");
  }
  count++;
  initX = li.get(li.size()-1)[0];
  initY = li.get(li.size()-1)[1];
  //grap.point(li.get(li.size()-1)[0],li.get(li.size()-1)[1]);
  grap.endDraw();
}

float randRadius () {
  return random(minRad, maxRad);
}

float randSpeed () {
  return random(minSpeed, maxSpeed);
}

float randPos () {
  return random (0, 2*PI);
}

void circle(float x, float y, float r) {
  ellipse(x, y, r*2, r*2);
}
