void setup() {
  size (900, 900); //width,height
  background (0); //changes the backgroud to black
  stroke (255, 255, 255, 255); //makes the line white
}

void draw() {
  
}

void circle(float x, float y, float r) {
  ellipse(x, y, r*2, r*2);
}
