float x1 = 0;
float x2 = 0;
float y1 = 0;
float y2 = 0;

float i1 = 0.01;
float i2 = 0.0092;

float scale = 400;

void setup() {
    size (1000, 1000); //width,height
    background (0, 0, 0);
    stroke (255); //changes the color of the lines to white
}

void draw() {
    //clear();

    line (cos(x1)*scale + width/2,sin(y1)*scale + height/2,cos(x2)*scale + width/2,sin(y2)*scale + height/2);
    x1 = x1 + i1;
    y1 = y1 + i1;
    x2 = x2 + i2;
    y2 = y2 + i2;
}
