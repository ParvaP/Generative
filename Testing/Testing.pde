int n = 5; //number of pairs of points

float x1;
float x2;
float y1;
float y2;

float a = 0; 
float scale1 = 100;

float mS = 5;

void setup(){
    size (900,900);
    background(0);
    stroke(255);
    strokeWeight(4);

    x1 = 0;
    x2 = 0;
    y1 = 
    y2 = 0;
}

void draw(){
    p1();
    p2();
    line(x1,y1,x2,y2);
    x1 += mS;
    x2 += mS;

    if (x1 >= 900){
        y1 += 110;
        y2 += 110;
        x1 = 0;
        x2 = 0;
        clear();
    }

    a += 0.1;
}

//Generate poition of first point
void p1(){
  x1 = x1;
  y1 = height;
}

//Generate position of second point
void p2(){
  x2 = x2;
  y2 = (height-300) - noise (a + 10)*scale1;
}
