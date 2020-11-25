int n = 5; //number of pairs of points

float x1;
float x2;
float y1;
float y2;

float a = 0; 
float scale = 50;

void setup(){
    size (900,900);
    background(0);
    stroke(255);
    strokeWeight(4);

    x1 = 0;
    x2 = 0;
    y1 = 0;
    y2 = 0;
}

void draw(){
    line(x1,y1+sin(a)*scale,x2,y2+cos(a)*scale);
    x1 += 10;
    x2 += 10;

    if (x1 >= 900){
        y1 += 110;
        y2 += 110;
        x1 = 0;
        x2 = 0;
    }

    a += 0.1;
}
