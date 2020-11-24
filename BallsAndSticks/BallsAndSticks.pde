ArrayList<int[]> li = new ArrayList<int[]>(); //This is the list that will hold all the information about each ball

/*
[x,y,r,s,a];
x,y = x and y of the middle of the circle
r = radius of the circle
s = speed of the next circle
a = the number used to generate the position of the circle
*/

//min and max radius of a circle
float minRad = 10;
float maxRad = 100;

//min and max speed of a circle
float minSpeed = 0.01;
float maxSpeed = 0.1;


float x1;
float y1;
float r1;
float s1;
float a1;

float x2;
float y2;
float r2;
float s2;
float a2;


void setup() {
    size (1000,1000); //width,height
    background (0); //changes the backgroud to black
    stroke (255); //changes the color of the lines to white
    noFill(); //stops the shapes from being filled

    x1 = 500;
    y1 = 500;
    r1 = 100;
    a1 = 0;

    r2 = 50;
}

void draw() {
    clear();
    x2 = r1*cos(a1) + x1;
    y2 = r1*sin(a1) + y1;
    a1= a1+ 0.1;

    circle (x1,y1,r1);
    circle (x2,y2,r2);
    line (x1,y1,x2,y2);
}

float randRadius (){
    return random(minRad, maxRad);
}

float randSpeed (){
    return random(minSpeed, maxSpeed);
}

float randPos (){
    return random (0,2*PI);
}

void circle(float x, float y, float r){
    ellipse(x, y, r*2, r*2);
}
