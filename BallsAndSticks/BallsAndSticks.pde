ArrayList<float[]> li = new ArrayList<float[]>(); //This is the list that will hold all the information about each ball

/*
[x,y,r,s,a];
x,y = x and y of the middle of the circle
r = radius of the circle
s = speed of the next circle
a = the number used to generate the position of the next circle
*/

//min and max radius of a circle
float minRad = 10;
float maxRad = 60;

//min and max speed of a circle
float minSpeed = 0.01;
float maxSpeed = 0.1;


float x;
float y;
float r;
float s;
float a;



float distanceToWall = width/2; //May use this later

int n = 10; //number of balls

void setup() {
    size (900,900); //width,height
    background (0); //changes the backgroud to black
    stroke (255); //changes the color of the lines to white
    noFill(); //stops the shapes from being filled

    x = width/2;
    y = height/2;
    r = randRadius();
    a = randPos();
    s = randSpeed();

    li.add(0,new float[]{x,y,r,s,a});

    for (int i = 1; i < n; i++){
        /*
        X = [0];
        Y = [1];
        R = [2];
        S = [3];
        A = [4];
        */

        x = li.get(li.size()-1)[2]*cos(li.get(li.size()-1)[4]) + li.get(li.size()-1)[0];
        y = li.get(li.size()-1)[2]*sin(li.get(li.size()-1)[4]) + li.get(li.size()-1)[1];
        r = randRadius();
        s = randSpeed();
        a = randPos();

        li.add(i,new float[]{x,y,r,s,a});
    }
}

void draw() {
    clear();

    /*
    X = [0];
    Y = [1];
    R = [2];
    S = [3];
    A = [4];
    */

    for (int i = 0; i < li.size(); i++){
        circle(li.get(i)[0],li.get(i)[1],li.get(i)[2]);
    }

    for (int i = 1; i < li.size(); i++){
        li.get(i-1)[4] = li.get(i-1)[4] + li.get(i)[3];

        li.get(i)[0] = li.get(i-1)[2]*cos(li.get(i-1)[4]) + li.get(i-1)[0];
        li.get(i)[1] = li.get(i-1)[2]*sin(li.get(i-1)[4]) + li.get(i-1)[1];

        line(li.get(i-1)[0],li.get(i-1)[1],li.get(i)[0],li.get(i)[1]);
    }

    /*x2 = r1*cos(a1) + x1;
    y2 = r1*sin(a1) + y1;
    a1= a1+ 0.1;

    circle (x1,y1,r1);
    circle (x2,y2,r2);
    line (x1,y1,x2,y2);*/
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
