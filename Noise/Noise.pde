int n = 5; //number of pairs of points

float x1;
float x2;
float y1;
float y2;

float sep; //x seperation between points

float aS = 0.1; //speed it moves through the noise
float a = 0; //position in the noise

float scale = 100; //scale of noise

float mS = 5; //speed the simulaton moves at on x

void setup(){
    size (900,900);
    background(0);
    stroke(255);
    strokeWeight(4);
    x1 = 0;
    x2 = sep;
    y1 = 200;
    y2 = 200;
}

void draw(){
    line (x1,p1(),x2,p2());

    a += aS;
    x1 += mS;
    x2 += mS;
}

//Generate poition of first point
float p1(){
  return noise (a)*scale + y1;
}

//Generate position of second point
float p2(){
  return noise (a + aS)*scale + y2;
}
