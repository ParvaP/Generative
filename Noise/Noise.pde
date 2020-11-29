int n = 0; //Number of layers drawn

float x;
float y;

float aS = 0.1; //speed it moves through the noise
float a = random(0,100); //starting position in the noise

float scale = 150; //scale of noise

float mS = 5; //speed the simulaton moves at on x and also the seperation between the Xs

float drop = 150;

float aSRate = 1.5; //how much aS is divided by each time
float dropRate = 1.1; //how much drop is divided by each time
float scaleRate = 1.1; //how much scale is divided by each time

void setup(){
    size (900,920);
    background(0);
    stroke(255);
    strokeWeight(2);
    x = 0;
    y = 200;
}

void draw(){
    if (x >= width){
      x = 0;
      y += drop;

      aS = aS/aSRate;
      drop = drop/dropRate;
      scale = scale/scaleRate;
      n++;
    }

    if (n == 7){
      saveFrame("output/out-3.png");
    }

    line (x,p1(),x + mS,p2());

    a += aS;
    x += mS;
}

//Generate poition of first point
float p1(){
  return y-noise (a)*scale;
}

//Generate position of second point
float p2(){
  return y-noise (a + aS)*scale;
}
