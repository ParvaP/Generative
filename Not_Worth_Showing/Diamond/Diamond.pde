float scale;

int n = 20; //number of lines

void setup () {
  size(900, 900); //width,height
  background (0, 0, 0);
  stroke (255); //changes the color of the lines to white
  fill(255);
  scale = width/2.5;
}

float speed = 0.5;
float off = 2*PI/n;

void draw () {
  update();
  for (int i = 0 ; i < n ; i++){
    line (width/2, 0, width/2 + wave(off*i),height/2);
    line (width/2, height, width/2 + wave(off*i),height/2);

    line (width/2+wave(off*i), height/2, width/2+wave(off*(i+1)), height/2);
  }
}

void update(){
  clear();
}

float wave (float offset){
  return sin(radians(frameCount*speed)+ offset)*scale;
}
